// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => '설정';

  @override
  String get about => '정보';

  @override
  String get startDate => '시작일';

  @override
  String get endDate => '종료일';

  @override
  String get pickStartDate => '시작일 선택';

  @override
  String get pickEndDate => '종료일 선택';

  @override
  String get appDescription =>
      '이 앱은 무작위 날짜를 표시합니다. 그 날짜가 무슨 요일인지 계산해서 알맞은 요일을 선택하세요.';

  @override
  String get author => '제작자';

  @override
  String get howTo => '요일 계산 방법을 아직 모르더라도 충분히 배울 수 있습니다:';

  @override
  String get moreInfo => '자세히 알아보기';

  @override
  String get ok => '확인';

  @override
  String get version => '버전';

  @override
  String get timer => '스톱워치';

  @override
  String get enabled => '사용';

  @override
  String get disabled => '사용 안함';

  @override
  String get reappearMsg => '숨겨진 날짜를 탭하면 다시 표시됩니다';

  @override
  String after(String duration) {
    return '$duration 후';
  }

  @override
  String get dateRange => '날짜 범위';

  @override
  String get firstDayInList => '목록의 첫 번째 요일';

  @override
  String get localeDefault => '자동';

  @override
  String get shortDateDisplay => '날짜 잠깐만 표시';

  @override
  String get hideTheDate => '날짜 숨기기';

  @override
  String get rangeCustom => '직접 선택';

  @override
  String get rangeThisMonth => '이번 달';

  @override
  String get rangeThisYear => '올해';

  @override
  String get rangeNextYear => '내년';

  @override
  String get rangeLast100Years => '최근 100년';

  @override
  String get rangeCentury20 => '20세기';

  @override
  String get rangeCentury21 => '21세기';

  @override
  String get rangeGregorianToToday => '1582-10-15 – 오늘';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => '통계';

  @override
  String get rounds => '라운드';

  @override
  String get accuracy => '정답률';

  @override
  String get averageTime => '평균 시간';

  @override
  String get bestTime => '최고 기록';

  @override
  String get currentStreak => '현재 연속 정답';

  @override
  String get bestStreak => '최다 연속 정답';

  @override
  String get allTime => '전체 기간';

  @override
  String lastNRounds(int n) {
    return '최근 $n라운드';
  }

  @override
  String nRounds(int n) {
    return '$n라운드';
  }

  @override
  String get allRanges => '모든 날짜 범위';

  @override
  String get noRoundsYet => '아직 플레이한 라운드가 없습니다. 첫 번째 답변 후 여기에 통계가 표시됩니다.';

  @override
  String get recentWindow => '최근 통계에 포함할 라운드 수';

  @override
  String get resetStatistics => '통계 초기화';

  @override
  String get resetStatisticsConfirm => '기록된 모든 라운드를 삭제할까요? 이 작업은 취소할 수 없습니다.';

  @override
  String get delete => '삭제';

  @override
  String get cancel => '취소';

  @override
  String withAverage(int count, String time) {
    return '$count · 평균 $time';
  }

  @override
  String get practiceReminders => '연습 알림';

  @override
  String get practiceRemindersHint => '하루 동안 무작위 날짜를 알림으로 받기';

  @override
  String get remindersPerDay => '하루 알림 횟수';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '하루 $n회',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => '가장 이른 알림';

  @override
  String get latestReminder => '가장 늦은 알림';

  @override
  String get notificationsBlocked =>
      'Guessaday의 알림이 꺼져 있습니다. 알림을 받으려면 시스템 설정에서 알림을 허용하세요.';

  @override
  String get reminderTitle => '무슨 요일일까요?';

  @override
  String get reveal => '정답 보기';

  @override
  String get practice => '연습하기';
}
