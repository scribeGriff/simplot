// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

/**
 * A simple 2D canvas plotting library.
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

//void main() {
//  String color = 'black';
//  String color2 = 'green';
//  String color3 = 'blue';
//  String color4 = 'red';
//
//  List ydata = [0.045, 1.233, 2.908, 3.672];
//  List ydata2 = null;
//  List ydata3 = null;
//  List ydata4 = null;

//
//  LinkedHashMap ydatas = new LinkedHashMap();
//
//  ydatas[color] = ydata;
//  ydatas[color2] = ydata2;
//  ydatas[color3] = ydata3;
//  ydatas[color4] = ydata4;
//
//  for (var key in ydatas.keys) {
//    print('$key, ${ydatas[key]}');
//  }
//
//  bool first = true;
//  var miny, maxy;
//  for (var value in ydatas.values) {
//    if (value != null) {
//      if (value.isEmpty) {
//        throw new ArgumentError("Empty data lists are not allowed.");
//      } else if (first) {
//        miny = value.fold(value.first, min);
//        maxy = value.fold(value.first, max);
//        first = false;
//      } else {
//        var tempMin = value.fold(value.first, min);
//        if (tempMin < miny) miny = tempMin;
//        var tempMax = value.fold(value.first, max);
//        if (tempMax > maxy) maxy = tempMax;
//      }
//    }
//  }
//
//  //miny = ydata.fold(ydata.first, math.min);
//  //maxy = ydata.fold(ydata.first, math.max);
//
//  print('min of ydata: $miny, max of ydata: $maxy');
//}

