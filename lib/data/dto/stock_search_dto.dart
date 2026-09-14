import '../../domain/model/stock_search_result.dart';

class StockSearchDto {
  const StockSearchDto({
    required this.code,
    required this.name,
    required this.typeCode,
    required this.typeName,
    required this.url,
    required this.nationCode,
    required this.category,
  });

  factory StockSearchDto.fromJson(Map<String, Object?> json) => StockSearchDto(
    code: json['code'] as String?,
    name: json['name'] as String?,
    typeCode: json['typeCode'] as String?,
    typeName: json['typeName'] as String?,
    url: json['url'] as String?,
    nationCode: json['nationCode'] as String?,
    category: json['category'] as String?,
  );

  final String? code;
  final String? name;
  final String? typeCode;
  final String? typeName;
  final String? url;
  final String? nationCode;
  final String? category;

  bool get isDomesticStock =>
      nationCode == 'KOR' && category?.toLowerCase() == 'stock';

  bool get hasValidSymbol => RegExp(r'^\d{6}$').hasMatch(code ?? '');

  StockSearchResult? toDomain() {
    final String? symbol = code;
    final String? stockName = name;
    if (!isDomesticStock ||
        !hasValidSymbol ||
        symbol == null ||
        stockName == null ||
        stockName.isEmpty) {
      return null;
    }
    return StockSearchResult(
      id: 'domestic:$symbol',
      symbol: symbol,
      name: stockName,
      exchangeName: typeName ?? typeCode ?? '',
      category: category ?? '',
    );
  }
}
