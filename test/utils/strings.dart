import 'package:flutter_test/flutter_test.dart';
import '../../lib/unit_test/test_case.dart';
import '../../lib/utils/strings_utils.dart';

void main() {
  testStringsPadding();
}

void testStringsPadding() {
  test("strings padding", () {
    List<TestCase> cases = [
      TestCase(name: "", input: ["abc", 9, ".", 0], wanted: "abc......"),
      TestCase(name: "", input: ["abc", 2, ".", 0], wanted: "ab"),
      TestCase(name: "", input: ["abc", 9, ". ", 1], wanted: "abc . . ."),
    ];

    for (TestCase eachCase in cases) {
      expect(
          stringsPadding(
            eachCase.input[0],
            eachCase.input[1],
            eachCase.input[2],
            eachCase.input[3],
          ),
          eachCase.wanted);
    }
  });
}
