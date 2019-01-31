typedef bool TestOutputCheck(dynamic result);

class TestCase {
  final String name;
  final List<dynamic> input;
  final TestOutputCheck output;
  final dynamic wanted;

  const TestCase({
    this.name,
    this.input,
    this.output,
    this.wanted,
  });
}
