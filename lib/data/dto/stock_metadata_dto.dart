import '../../domain/model/stock_metadata.dart';

class StockMetadataDto {
  const StockMetadataDto({
    required this.symbolCode,
    required this.stockName,
    required this.stockExchangeNameKor,
  });

  factory StockMetadataDto.fromJson(Map<String, Object?> json) {
    final String? symbol = json['symbolCode'] as String?;
    final String? name = json['stockName'] as String?;
    final String? exchange = json['stockExchangeNameKor'] as String?;
    if (symbol == null || name == null || exchange == null) {
      throw const FormatException('Missing stock metadata field');
    }
    return StockMetadataDto(
      symbolCode: symbol,
      stockName: name,
      stockExchangeNameKor: exchange,
    );
  }

  final String symbolCode;
  final String stockName;
  final String stockExchangeNameKor;

  StockMetadata toDomain() => StockMetadata(
    symbol: symbolCode,
    name: stockName,
    exchangeName: stockExchangeNameKor,
  );
}
