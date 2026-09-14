import '../../core/domain/error/error.dart';

enum StockDataError implements Error {
  invalidSymbol,
  invalidPage,
  network,
  blocked,
  malformedResponse,
  decoding,
  parsing,
  emptyResult;

  @override
  String toString() => switch (this) {
    StockDataError.invalidSymbol => '올바른 종목코드를 입력해 주세요',
    StockDataError.invalidPage => '올바른 페이지를 요청해 주세요',
    StockDataError.network => '네트워크 연결을 확인해 주세요',
    StockDataError.blocked => '잠시 후 다시 시도해 주세요',
    StockDataError.malformedResponse => '시세 응답 형식을 확인할 수 없습니다',
    StockDataError.decoding => '시세 응답을 읽을 수 없습니다',
    StockDataError.parsing => '시세 데이터를 처리할 수 없습니다',
    StockDataError.emptyResult => '조회된 데이터가 없습니다',
  };
}
