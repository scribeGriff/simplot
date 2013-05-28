// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 * Unit testing of axis configure algorithm for the simplot library.
 */

void axisConfigTests() {
  logMessage('Performing axis config tests.');

  group('Testing axis scaling algorithm:', () {
    test('Calculate axis minimum scale value: Expect 0', () {
      expect(new _AxisConfig().axes(5, 495, 600).min, equals(0));
    });
    test('Calculate axis maximum scale value: Expect 500', () {
      expect(new _AxisConfig().axes(5, 495, 600).max, equals(500));
    });
    test('Calculate axis division scale value: Expect 60', () {
      expect(new _AxisConfig().axes(5, 495, 600).div, equals(60));
    });
    test('Calculate axis step scale value: Expect 50', () {
      expect(new _AxisConfig().axes(5, 495, 600).step, equals(50));
    });
  });
}
