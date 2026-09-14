# Edencrew 국내 주식 관심종목 앱

Naver 국내 주식 데이터를 이용해 관심종목, 종목 검색, 종목 상세 화면을 구현한 Flutter 과제 프로젝트입니다. 관심 상태는 세 화면에서 실시간으로 동기화되며, 시세 조회와 일별 시세 페이지 재사용을 고려해 데이터 계층을 구성했습니다.

## 실행 방법

### 개발 환경

- Flutter `3.47.1` (stable)
- Dart `3.13.1`
- 검증 호스트: Windows `10.0.26200.9445` 64-bit
- `flutter analyze` 및 전체 단위·위젯 테스트는 Windows 환경에서 확인했습니다.
- 실제 앱 실행은 Android 에뮬레이터 또는 모바일 기기를 권장합니다. Web은 Naver API의 CORS 정책 때문에 실데이터 요청이 동작하지 않습니다.

### 실행 명령

```bash
flutter pub get
flutter run
```

검증 명령은 다음과 같습니다.

```bash
flutter analyze
flutter test
```

### 폰트

기본 제공된 `Noto Sans KR`의 Regular, Medium, Bold 파일을 그대로 사용했습니다. `pubspec.yaml`에 등록된 `NotoSansKR`을 앱 전역 테마의 기본 글꼴로 적용했으며 별도의 폰트 패키지는 추가하지 않았습니다.

## 구현 범위

### 완료한 필수 항목

- 관심 화면
  - 종목명, 종목코드·시장, 현재가, 등락액·등락률 표시
  - 상승·하락·보합 색상 분리와 시세 로딩 전 스켈레톤 표시
  - 새로고침 및 현재가순·등락률순·가나다순 정렬
  - 관심종목이 없을 때 빈 상태와 정렬 바텀시트 구현
- 검색 화면
  - 검색어 입력·삭제, 검색 결과와 일치 문자열 강조
  - 검색 전·검색 결과 없음·네트워크 오류 상태 처리
  - 관심 등록·해제 즉시 반영과 하단 토스트 표시
  - 검색 결과 선택 시 종목 상세 화면으로 이동
- 종목 상세 화면
  - 현재가, 등락 정보, 시가·고가·저가·거래량·시가총액 표시
  - 1개월·3개월·6개월·1년 기간 전환
  - 기간별 캔들 차트와 일별 시세 표 표시
  - 상세 화면의 관심 등록·해제 및 토스트 표시
- 전체 상태 동기화
  - 관심 상태를 관심·검색·상세 화면에 실시간 반영
  - 검색 및 상세 화면에서 변경한 종목을 관심 목록에 즉시 반영

### 추가 구현 항목

- 검색 및 상세 데이터 로딩 UI
- 검색 요청 경합 시 오래된 응답 무시
- 일별 시세 페이지 메모리 캐시와 동일 요청 공유
- Naver EUC-KR/CP949 응답 디코딩
- 타입 안전한 `Result<D, E>` 기반 오류 처리
- 위젯, ViewModel, UseCase, Repository, DataSource, 파서 테스트

### 구현하지 않은 선택 항목

- 관심목록 및 정렬 기준의 앱 재실행 후 영구 저장
- 최근 검색어
- 관심종목 스와이프 삭제 및 Pull to refresh
- 차트 전환 애니메이션

## 기술 선택과 이유

### 구조와 상태관리

```text
lib/
├─ core/          공통 Result, DI, UI 컴포넌트, 포매터
├─ data/          DataSource, DTO, 파서, 캐시, Repository 구현
├─ domain/        모델, Repository 인터페이스, UseCase
├─ presentation/  화면별 State, Action, ViewModel, UI
└─ theme/         색상, 간격, 타이포그래피 토큰
```

- Data → Domain → Presentation으로 역할을 분리하고, UI가 HTTP 응답 형식에 직접 의존하지 않도록 DTO를 도메인 모델로 변환했습니다.
- 화면 상태는 `ChangeNotifier` ViewModel과 Freezed 불변 `State`/sealed `Action`으로 관리했습니다.
- Root 위젯은 DI와 `BuildContext`가 필요한 화면 효과를 담당하고, Screen 위젯은 상태 렌더링과 사용자 액션 전달에 집중하도록 분리했습니다.
- 관심목록은 `BehaviorSubject` 스트림으로 제공해 여러 화면의 별 상태와 목록이 같은 데이터를 관찰하도록 구성했습니다.
- 예외를 UI까지 던지는 대신 `Result<D, StockDataError>`로 성공과 실패를 명시적으로 처리했습니다.

### 주요 패키지

| 패키지 | 사용 목적 |
| --- | --- |
| `http` | Naver API 요청 |
| `html` | 일별 시세 HTML 파싱 |
| `cp949_codec` | EUC-KR/CP949 응답 디코딩 |
| `freezed` | 불변 State, Action, Result 모델 생성 |
| `json_serializable` | DTO·도메인 모델 JSON 변환 |
| `get_it` | DataSource부터 ViewModel까지 의존성 주입 |
| `rxdart` | `BehaviorSubject` 기반 관심 상태 스트림 |

### 차트

별도 차트 패키지 없이 Flutter `CustomPainter`로 캔들 차트를 구현했습니다. 조회 기간의 고가·저가로 Y축 범위를 정규화하고, 시가와 종가를 비교해 상승·하락·보합 색상을 적용했습니다. 단순한 요구 범위에 맞추면서 디자인 토큰을 직접 사용할 수 있다는 점을 선택 근거로 삼았습니다.

### 디자인 토큰

새 디자인 토큰은 추가하지 않았습니다. 화면 색상, 간격, 반경, 아이콘 크기는 기본 제공된 `AppColors`, `AppDimens`, `AppTypography`를 사용했습니다.

## 테스트 결과

```text
flutter analyze
No issues found!

flutter test
00:02 +70: All tests passed!
```

총 70개 테스트가 통과했습니다. 파싱·네트워크·캐시·Repository·UseCase 단위 테스트와 각 화면의 ViewModel·위젯 테스트, 관심 상태가 검색 → 상세 → 관심 목록으로 이어지는 통합 위젯 테스트를 포함합니다.

## 직접 판단한 부분과 이유

### 토스트 노출과 사라지는 방식

- 검색과 상세 화면 모두 Flutter의 floating `SnackBar`를 공통 토스트로 사용했습니다.
- 토스트는 `200ms` 동안 표시한 뒤 Flutter 기본 방식으로 사라지게 해 화면 내용을 오래 가리지 않도록 했습니다.
- 연속 조작 시 이전 토스트를 먼저 닫아 메시지가 대기열에 누적되지 않도록 했습니다.
- `IndexedStack`과 상세 Route에 있는 여러 `Scaffold`에 토스트가 중복 전달되지 않도록 화면별 `ScaffoldMessenger`로 표시 범위를 분리했습니다.

### 로딩, 네트워크 오류, 긴 텍스트

- 관심 시세 로딩 전에는 숫자 대신 스켈레톤을 표시하고, 검색 중에는 선형 진행 표시기, 상세 차트 로딩 중에는 원형 진행 표시기를 사용했습니다.
- 네트워크·응답 형식·파싱·잘못된 종목코드·페이지 오류를 `StockDataError`로 구분했습니다. 실패 시 로딩 상태를 종료하고 검색 화면에는 재시도 안내를 표시합니다.
- 긴 종목명과 표 셀은 한 줄 말줄임표로 처리해 작은 화면에서도 레이아웃이 깨지지 않게 했습니다.

### 시세를 받지 못한 종목의 정렬

- 현재가순과 등락률순에서는 시세가 없는 종목을 항상 목록 아래에 둡니다.
- 양쪽 모두 시세가 없거나 정렬 값이 같으면 종목명 가나다순을 보조 기준으로 사용해 결과가 매번 바뀌지 않도록 했습니다.

### Figma와 다르게 판단한 부분

- Figma에 정의되지 않은 로딩 및 오류 상태를 추가했습니다.
- 토스트는 시안의 색상·간격·아이콘 구성을 유지하면서 Material `SnackBar`로 구현해 접근성과 화면 하단 배치를 활용했습니다.
- 일별 시세 데이터가 없을 때 빈 차트 및 표 안내 문구를 표시합니다.

## 막혔던 지점과 접근 방법

- Naver 응답의 JSON과 HTML 인코딩이 서로 달라 Content-Type charset과 HTML meta charset을 확인한 뒤 CP949 디코딩을 적용했습니다.
- 기간별 일별 시세 요청이 중복되지 않도록 페이지 제한을 두고, 이미 받은 페이지와 동시에 들어온 동일 요청을 메모리에서 재사용했습니다.
- 여러 `Scaffold`가 같은 `ScaffoldMessenger`를 사용할 때 토스트 Hero 태그가 충돌하는 문제를 전체 위젯 테스트로 확인했습니다. 검색과 상세 화면에 별도의 Messenger 범위를 두어 해결했습니다.

## 참고 문서

- [과제 요구사항](docs/ASSIGNMENT.md)
- [Naver 데이터 연동 가이드](docs/NAVER_API.md)
- [디자인 토큰 대응표](lib/theme/README.md)

## 라이선스

이 프로젝트는 Edencrew 채용 과제 제출 범위에서만 공개합니다. 별도로 전달받은 Figma 자료와 Lucy Studio 설치 파일은 포함하지 않았습니다. 자세한 내용은 [LICENSE](LICENSE)를 확인해 주세요.
