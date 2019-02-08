/*
 * date_formatter_utils.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

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

  const DateFormation(int typeValue, String value) : super(typeValue, value);

  static const DateFormation ShortTime = const DateFormation(DateFormation.shortTime, "HH:mm");
  static const DateFormation MediumTime = const DateFormation(DateFormation.mediumTime, "HH:mm:ss");
  static const DateFormation LongTime = const DateFormation(DateFormation.longTime, "HH:mm:ss.SSS");
  static const DateFormation WeekDate = const DateFormation(DateFormation.weekDate, "EEEE dd/MM/yyyy");
  static const DateFormation TinyDate = const DateFormation(DateFormation.tinyDate, "yMMMd");
  static const DateFormation ShortDate = const DateFormation(DateFormation.shortDate, "dd/MM/YY");
  static const DateFormation MediumDate = const DateFormation(DateFormation.mediumDate, "yyyy-MM-dd");
  static const DateFormation MediumDateDotLongTime =
      const DateFormation(DateFormation.mediumDateDotLongTime, "dd.MM.yyyy HH:mm:ss.SSS");
  static const DateFormation MediumDateShortTime =
      const DateFormation(DateFormation.mediumDateShortTime, "yyyy-MM-dd HH:mm");
  static const DateFormation MediumDateMediumTime =
      const DateFormation(DateFormation.mediumDateMediumTime, "yyyy-MM-dd HH:mm:ss");
  static const DateFormation MediumDateLongTime =
      const DateFormation(DateFormation.mediumDateLongTime, "yyyy-MM-dd HH:mm:ss:SSS");
  static const DateFormation MediumDateLongLongTime =
      const DateFormation(DateFormation.mediumDateLongLongTime, "yyyy-MM-dd HH:mm:ss SSS");
  static const DateFormation Iso8601MediumDateMediumTime =
      const DateFormation(DateFormation.iso8601MediumDateMediumTime, "yyyy-MM-ddTHH:mm:ss+SSSS");
  static const DateFormation Iso8601MediumDateLongTime =
      const DateFormation(DateFormation.iso8601MediumDateLongTime, "yyyy-MM-ddTHH:mm:ss.SSSSSS");
}

class DateFormatter {
  static const String chinaLocale = "zh_CN";

  static DateFormat _dateFormat(String format, String locale) => DateFormat(format, locale);

  static DateFormat iso8601() =>
      _dateFormat(DateFormation.Iso8601MediumDateMediumTime.rawValue, DateFormatter.chinaLocale);

  static String stringWithDate(
    DateTime date, {
    DateFormation formation,
    String locale = DateFormatter.chinaLocale,
  }) {
    if (date == null) {
      return "";
    }

    locale = locale ?? DateFormatter.chinaLocale;
    formation = formation ?? DateFormation.Iso8601MediumDateMediumTime;

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

    formation = formation ?? DateFormation.Iso8601MediumDateMediumTime;
    locale = locale ?? DateFormatter.chinaLocale;

    Intl.defaultLocale = locale;

    var formatter = _dateFormat(formation.rawValue, locale);
    return formatter.parse(dateStr, isUtc);
  }

  static String _restrictFractionalSeconds(String dateTime) =>
      dateTime.replaceFirstMapped(RegExp("(\\.\\d{6})\\d+"), (m) => m[1]);
}
