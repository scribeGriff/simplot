// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplottests;

/**
 * Unit testing of logarithmic log2(x) and log10(x) functions.
 */

void logarithmicTests() {

  logMessage('Performing logarithmic tests.');

  logMessage('Performing log based 2 tests.');
  group('Log based 2 calculations:', () {
    test('Calculate the log2(1), expect 0', () {
      expect(log2(1).round(), equals(0));
    });
    test('Calculate the log2(2), expect 1', () {
      expect(log2(2).round(), equals(1));
    });
    test('Calculate the log2(4), expect 2', () {
      expect(log2(4).round(), equals(2));
    });
    test('Calculate the log2(8), expect 3', () {
      expect(log2(8).round(), equals(3));
    });
    test('Calculate the log2(16), expect 4', () {
      expect(log2(16).round(), equals(4));
    });
    test('Calculate the log2(32), expect 5', () {
      expect(log2(32).round(), equals(5));
    });
    test('Calculate the log2(64), expect 6', () {
      expect(log2(64).round(), equals(6));
    });
    test('Calculate the log2(128), expect 7', () {
      expect(log2(128).round(), equals(7));
    });
    test('Calculate the log2(256), expect 8', () {
      expect(log2(256).round(), equals(8));
    });
    test('Calculate the log2(512), expect 9', () {
      expect(log2(512).round(), equals(9));
    });
    test('Calculate the log2(1028), expect 10', () {
      expect(log2(1028).round(), equals(10));
    });
  });

  logMessage('Performing log based 10 tests.');
  group('Log based 10 calculations:', () {
    test('Calculate the log10(1), expect 0', () {
      expect(log10(1).round(), equals(0));
    });
    test('Calculate the log10(10), expect 1', () {
      expect(log10(10).round(), equals(1));
    });
    test('Calculate the log10(100), expect 2', () {
      expect(log10(100).round(), equals(2));
    });
    test('Calculate the log10(1000), expect 3', () {
      expect(log10(1000).round(), equals(3));
    });
    test('Calculate the log10(10000), expect 4', () {
      expect(log10(10000).round(), equals(4));
    });
    test('Calculate the log10(100000), expect 5', () {
      expect(log10(100000).round(), equals(5));
    });
    test('Calculate the log10(1000000), expect 6', () {
      expect(log10(1000000).round(), equals(6));
    });
    test('Calculate the log10(0.1), expect -1', () {
      expect(log10(0.1).round(), equals(-1));
    });
    test('Calculate the log10(0.01), expect -2', () {
      expect(log10(0.01).round(), equals(-2));
    });
    test('Calculate the log10(0.001), expect -3', () {
      expect(log10(0.001).round(), equals(-3));
    });
    test('Calculate the log10(0.0001), expect -4', () {
      expect(log10(0.0001).round(), equals(-4));
    });
  });
}
