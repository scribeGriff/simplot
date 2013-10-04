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
  test('Simplot headless testing with content_shell.', () {
    var args = ['--dump-render-tree', 'simplot_tests.html'];
    return Process.run('content_shell', args)
        .then((ProcessResult res) {
          expect(res.exitCode, 0);
          print(res.stdout);
          final passPattern = new RegExp('All \\d+ tests passed');
          expect(passPattern.hasMatch(res.stdout), true);
        });
    });
}