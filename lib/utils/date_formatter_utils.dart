import 'package:intl/intl.dart';

import '../common/enum_type.dart';

class DateFormation extends EnumType<int, String> {
  static const int shortTime = 0;
  static const int mediumTime = shortTime + 1;
  static const int longTime = mediumTime + 1;
  static const int weekDate = longTime + 1;
  static const int tinyDate = weekDate + 1;
  static const int shortDate = tinyDate + 1;
  static const int mediumDate = shortDate + 1;
  static const int mediumDateDotLongTime = mediumDate + 1;
  static const int mediumDateShortTime = mediumDateDotLongTime + 1;
  static const int mediumDateMediumTime = mediumDateShortTime + 1;
  static const int mediumDateLongTime = mediumDateMediumTime + 1;
  static const int mediumDateLongLongTime = mediumDateLongTime + 1;
  static const int iso8601MediumDateMediumTime = mediumDateLongLongTime + 1;
  static const int iso8601MediumDateLongTime = iso8601MediumDateMediumTime + 1;
  static const int customDateTime = iso8601MediumDateLongTime + 1;

  DateFormation(int typeValue, String value) : super(typeValue: typeValue, rawValue: value);

  factory DateFormation.getShortTime() => DateFormation(DateFormation.shortTime, "HH:mm");
  factory DateFormation.getMediumTime() => DateFormation(DateFormation.mediumTime, "HH:mm:ss");
  factory DateFormation.getLongTime() => DateFormation(DateFormation.longTime, "HH:mm:ss.SSS");
  factory DateFormation.getWeekDate() => DateFormation(DateFormation.weekDate, "EEEE dd/MM/yyyy");
  factory DateFormation.getTinyDate() => DateFormation(DateFormation.tinyDate, "yMMMd");
  factory DateFormation.getShortDate() => DateFormation(DateFormation.shortDate, "dd/MM/YY");
  factory DateFormation.getMediumDate() => DateFormation(DateFormation.mediumDate, "yyyy-MM-dd");
  factory DateFormation.getMediumDateDotLongTime() => DateFormation(DateFormation.mediumDateDotLongTime, "dd.MM.yyyy HH:mm:ss.SSS");
  factory DateFormation.getMediumDateShortTime() => DateFormation(DateFormation.mediumDateShortTime, "yyyy-MM-dd HH:mm");
  factory DateFormation.getMediumDateMediumTime() => DateFormation(DateFormation.mediumDateMediumTime, "yyyy-MM-dd HH:mm:ss");
  factory DateFormation.getMediumDateLongTime() => DateFormation(DateFormation.mediumDateLongTime, "yyyy-MM-dd HH:mm:ss:SSS");
  factory DateFormation.getMediumDateLongLongTime() => DateFormation(DateFormation.mediumDateLongLongTime, "yyyy-MM-dd HH:mm:ss SSS");
  factory DateFormation.getIso8601MediumDateMediumTime() => DateFormation(DateFormation.iso8601MediumDateMediumTime, "yyyy-MM-ddTHH:mm:ss+SSSS");
  factory DateFormation.getIso8601MediumDateLongTime() => DateFormation(DateFormation.iso8601MediumDateLongTime, "yyyy-MM-ddTHH:mm:ss.SSSSSS");
}

class DateFormatter {
  static const String chinaLocale = "zh_CN";

  static DateFormat _dateFormat(String format, String locale) => DateFormat(format, locale);

  static DateFormat iso8601() => _dateFormat(DateFormation.getIso8601MediumDateMediumTime().rawValue, DateFormatter.chinaLocale);

  static String stringWithDate(
    DateTime date, {
    DateFormation formation,
    String locale = DateFormatter.chinaLocale,
  }) {
    if (date == null) {
      return "";
    }

    locale = locale ?? DateFormatter.chinaLocale;
    formation = formation ?? DateFormation.getIso8601MediumDateMediumTime();

    var formatter = _dateFormat(formation.rawValue, locale);
    return formatter.format(date);
  }

  static DateTime dateWithString(
    String dateStr, {
    DateFormation formation,
    String locale = DateFormatter.chinaLocale,
  }) {
    if (dateStr == null || dateStr.length == 0) {
      return null;
    }

    dateStr = _restrictFractionalSeconds(dateStr);
    bool isUtc = locale == DateFormatter.chinaLocale;

    formation = formation ?? DateFormation.getIso8601MediumDateMediumTime();
    locale = locale ?? DateFormatter.chinaLocale;

    Intl.defaultLocale = locale;

    var formatter = _dateFormat(formation.rawValue, locale);
    return formatter.parse(dateStr, isUtc);
  }

  static String _restrictFractionalSeconds(String dateTime) => dateTime.replaceFirstMapped(RegExp("(\\.\\d{6})\\d+"), (m) => m[1]);
}
