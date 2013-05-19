// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 * Top level functions to implement some basic logarithms.
 *
 * The log(x) function in dart:math returns the natural logarithm of x.
 *
 * *log based 2 of x = natural log of x / natural log of 2
 * *log based 10 of x = natural log of x / natural log of 10
 */

// log base 2 of x.
num log2(num x) => log(x) / log(2);
// log base 10 of x.
num log10(num x) => log(x) / log(10);
