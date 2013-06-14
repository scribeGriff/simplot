// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

/**
 * A simple 2D canvas plotting library for generating graphs in a browser.
 *
 * Supports the following plot styles:
 *
 * * data
 * * points (scatter)
 * * line
 * * line with points (default)
 * * curve
 * * curve with points
 *
 *
 * An example of the simplest usage of the library would be:
 *     var values = [1, 3, 2, 5, 6.3, 17, 4];
 *     var myPlot = plot(values);
 *
 * An array of data of type List is the only required parameter. However,
 * the plot() command has a number of optional named parameters that allow
 * a high level of configurability.
 *
 */

library simplot;

import 'dart:html';
import 'dart:collection';
import 'dart:math';
import 'dart:async';
import 'dart:json' as json;

part 'src/axis_config.dart';
part 'src/plot2d.dart';
part 'src/logarithm.dart';
part 'src/date_time.dart';
part 'src/request_data_ws.dart';