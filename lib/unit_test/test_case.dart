/*
 * test_case.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

typedef dynamic UnitTestCustomFunc(dynamic result);

class TestCase {
  final String name;
  final List<dynamic> input;
  final UnitTestCustomFunc customTestCase;
  final dynamic wanted;

  const TestCase({
    this.name,
    this.input,
    this.customTestCase,
    this.wanted,
  });
}
