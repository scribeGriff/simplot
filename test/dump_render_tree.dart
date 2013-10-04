// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

library dumprendertree;

/**
 * DumpRenderTree process for headless testing.
 *
 */

import 'package:unittest/unittest.dart';
import 'dart:io';
import 'dart:async';

void main() {
  final passPattern = new RegExp('All \\d+ tests passed');
  final args = ['--dump-render-tree', 'simplot_tests.html'];
  test('Simplot headless testing with content_shell.', () {
    return Process.run('content_shell', args)
        .then((ProcessResult res) {
          expect(passPattern.hasMatch(res.stdout), true);
        });
    });
}