import '../../../core/domain/error/result.dart';
import '../../../domain/error/stock_data_error.dart';
import '../../cache/daily_price_page_cache.dart';
import '../../dto/daily_price_dto.dart';
import '../../dto/realtime_quote_dto.dart';
import '../../dto/stock_metadata_dto.dart';
import '../../dto/stock_search_dto.dart';
import '../../network/stock_http_client.dart';
import '../../parser/naver_daily_price_html_parser.dart';
import '../../parser/naver_stock_json_parser.dart';
import '../../parser/stock_response_decoder.dart';
import '../stock_data_source.dart';

class RemoteStockDataSourceImpl implements StockDataSource {
  const RemoteStockDataSourceImpl({
    required StockHttpClient httpClient,
    required DailyPricePageCache dailyPricePageCache,
    StockResponseDecoder responseDecoder = const StockResponseDecoder(),
    NaverStockJsonParser jsonParser = const NaverStockJsonParser(),
    NaverDailyPriceHtmlParser htmlParser = const NaverDailyPriceHtmlParser(),
  }) : _httpClient = httpClient,
       _dailyPricePageCache = dailyPricePageCache,
       _responseDecoder = responseDecoder,
       _jsonParser = jsonParser,
       _htmlParser = htmlParser;

  final StockHttpClient _httpClient;
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
    final Uri uri = Uri.https('ac.stock.naver.com', '/ac', <String, String>{
      'q': normalized,
      'target': 'stock,ipo,index,marketindicator',
    });
    final Result<StockHttpResponse, StockDataError> response = await _get(uri);
    return _parseJsonResponse<List<StockSearchDto>>(
      response,
      _jsonParser.parseSearch,
    );
  }

  @override
  Future<Result<List<RealtimeQuoteDto>, StockDataError>> getRealtimeQuotes(
    List<String> symbols,
  ) async {
    final List<String> uniqueSymbols = symbols.toSet().toList(growable: false);
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

    final Uri uri = Uri.https(
      'polling.finance.naver.com',
      '/api/realtime',
      <String, String>{'query': 'SERVICE_ITEM:${uniqueSymbols.join(',')}'},
    );
    final Result<StockHttpResponse, StockDataError> response = await _get(uri);
    return _parseJsonResponse<List<RealtimeQuoteDto>>(
      response,
      _jsonParser.parseRealtimeQuotes,
    );
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
    final Uri uri = Uri.https(
      'stock.naver.com',
      '/api/securityFe/api/fchart/domestic/stock/$symbol',
    );
    final Result<StockHttpResponse, StockDataError> response = await _get(uri);
    return _parseJsonResponse<StockMetadataDto>(
      response,
      _jsonParser.parseMetadata,
    );
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
        final Uri uri = Uri.https(
          'finance.naver.com',
          '/item/sise_day.naver',
          <String, String>{'code': symbol, 'page': '$page'},
        );
        final Result<StockHttpResponse, StockDataError> response = await _get(
          uri,
        );
        switch (response) {
          case ResultSuccess<StockHttpResponse, StockDataError>():
            final String source;
            try {
              source = _responseDecoder.decode(
                response.data.bodyBytes,
                contentType: response.data.headers['content-type'],
              );
            } on FormatException {
              return const Result<DailyPricePageDto, StockDataError>.error(
                StockDataError.decoding,
              );
            }
            try {
              final DailyPricePageDto parsed = _htmlParser.parse(source);
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
          case ResultError<StockHttpResponse, StockDataError>():
            return Result<DailyPricePageDto, StockDataError>.error(
              response.error,
            );
        }
      },
    );
  }

  Future<Result<StockHttpResponse, StockDataError>> _get(Uri uri) async {
    try {
      final StockHttpResponse response = await _httpClient.get(uri);
      if (response.statusCode == 403 || response.statusCode == 429) {
        return const Result<StockHttpResponse, StockDataError>.error(
          StockDataError.blocked,
        );
      }
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return const Result<StockHttpResponse, StockDataError>.error(
          StockDataError.network,
        );
      }
      return Result<StockHttpResponse, StockDataError>.success(response);
    } on Object {
      return const Result<StockHttpResponse, StockDataError>.error(
        StockDataError.network,
      );
    }
  }

  Result<T, StockDataError> _parseJsonResponse<T>(
    Result<StockHttpResponse, StockDataError> response,
    T Function(String source) parser,
  ) {
    switch (response) {
      case ResultSuccess<StockHttpResponse, StockDataError>():
        final String source;
        try {
          source = _responseDecoder.decode(
            response.data.bodyBytes,
            contentType: response.data.headers['content-type'],
          );
        } on FormatException {
          return Result<T, StockDataError>.error(StockDataError.decoding);
        }
        try {
          return Result<T, StockDataError>.success(parser(source));
        } on FormatException {
          return Result<T, StockDataError>.error(
            StockDataError.malformedResponse,
          );
        }
      case ResultError<StockHttpResponse, StockDataError>():
        return Result<T, StockDataError>.error(response.error);
    }
  }
}

bool _isValidSymbol(String symbol) => RegExp(r'^\d{6}$').hasMatch(symbol);
