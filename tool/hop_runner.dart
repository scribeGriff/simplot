// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

library dumprendertree;

/**
 * Headless testing with Hop.
 *
 */

import 'package:hop/hop.dart';
import 'dart:io';
import 'dart:async';

main(List<String> args) {
  addTask('test', createUnitTestTask());
  runHop(args);
}

Task createUnitTestTask() {
  return new Task((TaskContext tcontext) {
    tcontext.info("Running Unit Tests....");
    var result = Process.run('./content_shell',
        ['--dump-render-tree','test/simplot_tests.html'])
        .then((ProcessResult process) {
          tcontext.info(process.stdout);
        });
    return result;
  });
}