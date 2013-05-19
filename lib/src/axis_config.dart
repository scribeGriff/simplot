// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 *  Calculate optimum tick, min and max for a plot.
 *  To configure an axis:
 *     AxisConfigResults xAxisCfg = new _AxisConfig().axes(xmin, xmax, width);
 *     AxisConfigResults yAxisCfg = new _AxisConfig().axes(ymin, ymax, height);
 *  The parameters are returned as a _AxisConfigResults object:
 *     xmin = xAxisCfg.min;
 *     xmax = xAxisCfg.max;
 *     xdiv = xAxisCfg.div;
 *     xstep = xAxisCfg.step;
 *     ymin = yAxisCfg.min;
 *     ymax = yAxisCfg.max;
 *     ydiv = yAxisCfg.div;
 *     ystep = yAxisCfg.step;
 */

class _AxisConfig {
  /// _AxisConfig method axes() computes and returns axis min,
  /// max, division and step size.
  _AxisConfigResults axes(num listMin, num listMax, int distance) {
    //Target a major division of around 50 pixels
    var numDivs = (distance / 50).floor();
    //Compute the minimum clean range based on the data
    var range = idealRange(listMin, listMax);
    //Compute the spacing of the major divisions
    var divSp = idealTicks(range, numDivs);
    //Update the number of divisions to be a nice multiple
    var minsc = ((listMin / divSp).floorToDouble()) * divSp;
    var maxsc = ((listMax / divSp).ceilToDouble()) * divSp;
    if (minsc == maxsc) {
      minsc = 0.5 * minsc;
      maxsc = 1.5 * maxsc;
    }
    //Update actual distance of each major division
    var delDiv = distance * divSp / (maxsc - minsc);
    return new _AxisConfigResults(delDiv, minsc, maxsc, divSp);
  }

  /// Calculate the ideal range given the min and max of the list of points.
  num idealRange(num listMin, num listMax) {
    var ideal;
    var range = listMax - listMin;
    if (range == 0) {
      if (listMin == 0) {
        range = 1;
      } else {
        range = listMin;
      }
    }
    var exponent = (log10(range)).floorToDouble();
    var fraction = range / pow(10, exponent);

    if(fraction <= 1) {
      ideal = 1;
    } else if(fraction <= 2) {
      ideal = 2;
    } else if(fraction <= 5) {
      ideal = 5;
    } else {
      ideal = 10;
    }
    return ideal * pow(10, exponent);
  }

  /// Calculate the ideal tick spacing given the ideal range (delta)
  /// and the max number of tics based on about a 50 px spacing.
  num idealTicks(num delta, int maxNumTics) {
    var range = delta / maxNumTics;
    var exponent = (log10(range)).floor();
    range *= pow(10.0, -exponent);
    if (range > 5.0) {
      range = 10.0;
    } else if (range > 2.0) {
      range = 5.0;
    } else if (range > 1.0) {
      range = 2.0;
    }
    range *= pow(10.0, exponent);
    return range;
  }
}

/**
 *   Private class _AxisConfigResults.
 */
class _AxisConfigResults {
  final num div;
  final num min;
  final num max;
  final num step;

  _AxisConfigResults(this.div, this.min, this.max, this.step);

}
