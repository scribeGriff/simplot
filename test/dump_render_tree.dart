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
  Process.run('DumpRenderTree', ['simplot_tests.html']).then((ProcessResult results) {
    if (results.exitCode == 0) {
      print('All tests completed successfully.');
    } else {
      print('Some of the tests have failed.');
    }
  });

  // Once DRT is replaced with content_shell, the following is supposed to work.
  // It currently returns with an exit code of 1.  The stderr is related to the
  // Windows OS configuration.  Not sure how to fix that yet.
//  test('Simplot headless testing with content_shell.', () {
//    var args = ['--dump-render-tree', 'simplot_tests.html'];
//    expect(Process.run('content_shell', args).then((res) {
//      expect(res.exitCode, 0, reason: 'content_shell exit code: '
//        '${res.exitCode}. Contents of stderr: \n${res.stderr}');
//      }), completes);
//    });
}