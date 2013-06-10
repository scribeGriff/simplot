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

void main() {
  // The following passes on drone.io (ie, linux) but fails in Windows (returns
  // exit code 1) when run locally.  The stderr is related to the Windows OS
  // configuration.
  test('Simplot headless testing with content_shell.', () {
    var args = ['--dump-render-tree', 'simplot_tests.html'];
    expect(Process.run('content_shell', args).then((res) {
      expect(res.exitCode, 0, reason: 'content_shell exit code: '
        '${res.exitCode}. Contents of stderr: \n${res.stderr}');
      }), completes);
    });
}