// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

library simplottests;

/**
 * Unit testing for simplot library.
 *
 * Includes tests for the following library functions:
 * * logarithmic functions
 * * time stamp
 * * axis configure
 * * canvas create
 *
 */

import 'package:simplot/simplot.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'dart:html';

part 'tests/logarithmic_tests.dart';
part 'tests/time_stamp_tests.dart';
part 'tests/axis_configure_tests.dart';
part 'tests/create_single_plot.dart';

void main() {
  print('Running unit tests for simplot library.');
  useHtmlEnhancedConfiguration();
  group('All Tests:', (){
    test('test of logarithmic functions', () => logarithmicTests());
    test('test of time stamp', () => timeStampTests());
    test('test of axis configuration', () => axisConfigTests());
    test('test of creating a canvas', () => canvasCreateTests());
  });
}
