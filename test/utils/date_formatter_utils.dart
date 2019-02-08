import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../lib/utils/date_formatter_utils.dart';
import '../../lib/unit_test/test_case.dart';

void main() {
  testDateFormatter();
}

void testDateFormatter() {
  initializeDateFormatting(DateFormatter.chinaLocale, null).whenComplete(() {
    test("Testing DateFormat helper", () {
      List<TestCase> allCases = [
        TestCase(
          name: "WeekDate zh-CN",
          input: ["星期一 03/12/2018", DateFormation.WeekDate, null],
          wanted: "星期一 03/12/2018",
        ),
        TestCase(
          name: "WeekDate en-US",
          input: ["Monday 03/12/2018", DateFormation.WeekDate, "en_US"],
          wanted: "Monday 03/12/2018",
        ),
        TestCase(
          name: "MediumDateShortTime",
          input: ["2018-12-03 23:35", DateFormation.MediumDateShortTime, null],
          wanted: "2018-12-03 23:35",
        ),
        TestCase(
          name: "MediumDateDotLongTime",
          input: ["03.12.2018 23:35:55.000", DateFormation.MediumDateDotLongTime, null],
          wanted: "03.12.2018 23:35:55.000",
        ),
        TestCase(
          name: "Iso8601MediumDateMediumTime",
          input: ["2018-12-03T14:31:27+0000", DateFormation.Iso8601MediumDateMediumTime, null],
          wanted: "2018-12-03T14:31:27+0000",
        ),
        TestCase(
          name: "Iso8601MediumDateLongTime",
          input: ["2018-07-10T12:04:35.000000", DateFormation.Iso8601MediumDateLongTime, null],
          wanted: "2018-07-10T12:04:35.000000",
        ),
      ];

      for (TestCase eachCase in allCases) {
        DateTime date =
            DateFormatter.dateWithString(eachCase.input[0], formation: eachCase.input[1], locale: eachCase.input[2]);
        String dateString = DateFormatter.stringWithDate(date, formation: eachCase.input[1], locale: eachCase.input[2]);
        expect(dateString, eachCase.wanted,
            reason: "Fails in testing: ${eachCase.name}, want: ${eachCase.wanted}, get $dateString");
      }
    });
  });
}
