// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

/**
 * A simple 2D canvas plotting library for generating graphs in a browser.
 *
 * Supports a variety of plot styles, including:
 *
 * *data
 * *points (scatter)
 * *line
 * *line with points (default)
 * *curve
 * *curve with points
 *
 * To use the library, add the following to your pubspec.yaml:
 *     simplot:
 *       git: git://github.com/scribeGriff/simplot.git
 *
 * Then import the library to your app:
 *     import 'package:simplot/simplot.dart';
 *
 * An example of the simplest usage of the library would be:
 *     var data = [1, 3, 2, 5, 6.3, 17, 4];
 *     var dataPlot = plot(data);
 *
 * An array of data of type List is the only required parameter. However,
 * the plot() command has a number of optional named parameters:
 *
 * *xdata: an array of type List. If xdata is not defined, the x axis is
 *  automatically generated as a vector from 1:n where n is the length of
 *  the required input array parameter.
 * *y2: an array of type List. Additional data to be plotted on same axes.
 * *y3: an array of type List. Additional data to be plotted on same axes.
 * *y4: an array of type List. Additional data to be plotted on same axes.
 * *style1: a String defining the type of plot (line, curve, etc) for the
 *  first set of data. Default value is linepts.
 * *style2: a String defining the type of plot (line, curve, etc) for the
 *  second set of data. Default value is style1.
 * *style3: a String defining the type of plot (line, curve, etc) for the
 *  third set of data. Default value is style1.
 * *style4: a String defining the type of plot (line, curve, etc) for the
 *  fourth set of data. Default value is style1.
 * *color1: a String defining the color of the plot for the first set of data.
 *  Default value is black.
 * *color2: a String defining the color of the plot for the second set of data.
 *  Default value is ForestGreen.
 * *color3: a String defining the color of the plot for the third set of data.
 *  Default value is Navy.
 * *color4: a String defining the color of the plot for the fourth set of data.
 *  Default value is FireBrick.
 * *linewidth: an integer that specifies the stroke width of the lines used to
 *  draw the plots. Default value is 2.
 * *range: an int that specifies how many total graphs are intended on the
 *  canvas. The only effect is to scale each plotted graph. Default value is 1
 *  for a single graph.
 * *index: an int that should be between 1 and range. The only effect is to
 *  define a unique id to a particular graph. For example, if index = 1, the
 *  plot is assigned an id of simPlot1.  The default value is 1.
 * *container: a String value indicating the id of the container holding the
 *  plot canvases. The id defaults to #simPlotQuad.
 *
 *  A complete example is included in the example directory of the repo.
 */

library simplot;

import 'dart:html';
import 'dart:collection';
import 'dart:math';
import 'dart:async';

part 'src/axis_config.dart';
part 'src/plot2d.dart';
part 'src/logarithm.dart';
part 'src/date_time.dart';