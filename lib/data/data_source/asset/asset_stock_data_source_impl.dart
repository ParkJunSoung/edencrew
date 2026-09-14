import '../../../core/domain/error/result.dart';
import '../../../domain/error/stock_data_error.dart';
import '../../asset/stock_asset_reader.dart';
import '../../cache/daily_price_page_cache.dart';
import '../../dto/daily_price_dto.dart';
import '../../dto/realtime_quote_dto.dart';
import '../../dto/stock_metadata_dto.dart';
import '../../dto/stock_search_dto.dart';
import '../../parser/naver_daily_price_html_parser.dart';
import '../../parser/naver_stock_json_parser.dart';
import '../../parser/stock_response_decoder.dart';
import '../stock_data_source.dart';

class AssetStockDataSourceImpl implements StockDataSource {
  const AssetStockDataSourceImpl({
    required StockAssetReader assetReader,
    required DailyPricePageCache dailyPricePageCache,
    StockResponseDecoder responseDecoder = const StockResponseDecoder(),
    NaverStockJsonParser jsonParser = const NaverStockJsonParser(),
    NaverDailyPriceHtmlParser htmlParser = const NaverDailyPriceHtmlParser(),
  }) : _assetReader = assetReader,
       _dailyPricePageCache = dailyPricePageCache,
       _responseDecoder = responseDecoder,
       _jsonParser = jsonParser,
       _htmlParser = htmlParser;

  final StockAssetReader _assetReader;
  final DailyPricePageCache _dailyPricePageCache;
  final StockResponseDecoder _responseDecoder;
  final NaverStockJsonParser _jsonParser;
  final NaverDailyPriceHtmlParser _htmlParser;

  @override
  Future<Result<List<StockSearchDto>, StockDataError>> searchStocks(
    String query,
  ) async {
    final String normalized = query.trim();
    if (normalized.isEmpty) {
      return const Result<List<StockSearchDto>, StockDataError>.success(
        <StockSearchDto>[],
      );
    }
    final Result<String, StockDataError> source = await _read(
      'assets/mock/naver_stock_search.json',
      contentType: 'application/json; charset=utf-8',
    );
    return _parseJson<List<StockSearchDto>>(source, (String value) {
      return _jsonParser
          .parseSearch(value)
          .where((StockSearchDto item) {
            final String normalizedQuery = normalized.toLowerCase();
            return (item.name?.toLowerCase().contains(normalizedQuery) ??
                    false) ||
                (item.code?.contains(normalizedQuery) ?? false);
          })
          .toList(growable: false);
    });
  }

  @override
  Future<Result<List<RealtimeQuoteDto>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  ) async {
    final Set<String> uniqueSymbols = symbols.toSet();
    if (uniqueSymbols.isEmpty) {
      return const Result<List<RealtimeQuoteDto>, StockDataError>.success(
        <RealtimeQuoteDto>[],
      );
    }
    if (uniqueSymbols.any((String symbol) => !_isValidSymbol(symbol))) {
      return const Result<List<RealtimeQuoteDto>, StockDataError>.error(
        StockDataError.invalidSymbol,
      );
    }
    final Result<String, StockDataError> source = await _read(
      'assets/mock/naver_realtime_quotes.json',
      contentType: 'application/json; charset=euc-kr',
    );
    return _parseJson<List<RealtimeQuoteDto>>(source, (String value) {
      return _jsonParser
          .parseRealtimeQuotes(value)
          .where((RealtimeQuoteDto item) => uniqueSymbols.contains(item.symbol))
          .toList(growable: false);
    });
  }

  @override
  Future<Result<StockMetadataDto, StockDataError>> getStockMetadata(
    String symbol,
  ) async {
    if (!_isValidSymbol(symbol)) {
      return const Result<StockMetadataDto, StockDataError>.error(
        StockDataError.invalidSymbol,
      );
    }
    final Result<String, StockDataError> source = await _read(
      'assets/mock/naver_stock_metadata.json',
      contentType: 'application/json; charset=utf-8',
    );
    final Result<StockMetadataDto, StockDataError> parsed =
        _parseJson<StockMetadataDto>(source, _jsonParser.parseMetadata);
    return switch (parsed) {
      ResultSuccess<StockMetadataDto, StockDataError>()
          when parsed.data.symbolCode != symbol =>
        const Result<StockMetadataDto, StockDataError>.error(
          StockDataError.emptyResult,
        ),
      _ => parsed,
    };
  }

  @override
  Future<Result<DailyPricePageDto, StockDataError>> getDailyPricePage({
    required String symbol,
    required int page,
  }) {
    if (!_isValidSymbol(symbol)) {
      return Future.value(
        const Result<DailyPricePageDto, StockDataError>.error(
          StockDataError.invalidSymbol,
        ),
      );
    }
    if (page < 1) {
      return Future.value(
        const Result<DailyPricePageDto, StockDataError>.error(
          StockDataError.invalidPage,
        ),
      );
    }
    return _dailyPricePageCache.getOrLoad(
      symbol: symbol,
      page: page,
      loader: () async {
        final Result<String, StockDataError> source = await _read(
          'assets/mock/naver_daily_prices_page_$page.html',
          contentType: 'text/html; charset=euc-kr',
        );
        switch (source) {
          case ResultSuccess<String, StockDataError>():
            try {
              final DailyPricePageDto parsed = _htmlParser.parse(source.data);
              if (parsed.prices.isEmpty) {
                return const Result<DailyPricePageDto, StockDataError>.error(
                  StockDataError.emptyResult,
                );
              }
              return Result<DailyPricePageDto, StockDataError>.success(parsed);
            } on FormatException {
              return const Result<DailyPricePageDto, StockDataError>.error(
                StockDataError.parsing,
              );
            }
          case ResultError<String, StockDataError>():
            return Result<DailyPricePageDto, StockDataError>.error(
              source.error,
            );
        }
      },
    );
  }

  Future<Result<String, StockDataError>> _read(
    String path, {
    required String contentType,
  }) async {
    final List<int> bytes;
    try {
      bytes = await _assetReader.readBytes(path);
    } on Object {
      return const Result<String, StockDataError>.error(
        StockDataError.emptyResult,
      );
    }
    try {
      return Result<String, StockDataError>.success(
        _responseDecoder.decode(bytes, contentType: contentType),
      );
    } on FormatException {
      return const Result<String, StockDataError>.error(
        StockDataError.decoding,
      );
    }
  }

  Result<T, StockDataError> _parseJson<T>(
    Result<String, StockDataError> source,
    T Function(String value) parser,
  ) {
    switch (source) {
      case ResultSuccess<String, StockDataError>():
        try {
          return Result<T, StockDataError>.success(parser(source.data));
        } on FormatException {
          return Result<T, StockDataError>.error(
            StockDataError.malformedResponse,
          );
        }
      case ResultError<String, StockDataError>():
        return Result<T, StockDataError>.error(source.error);
    }
  }
}

bool _isValidSymbol(String symbol) => RegExp(r'^\d{6}$').hasMatch(symbol);
