// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplottests;

/**
 * Unit testing of creating a canvas plotting element with the simplot library.
 */

void canvasCreateTests() {
  logMessage('Performing plotting to canvas tests.');

  group('Testing the plot() function:', () {
    DivElement container, graph;

    // Set up the containers to hold the plots.
    setUp((){
      container = new DivElement();
      container
        ..id = "container"
        ..style.width = "100%"
        ..style.position = "relative"
        ..style.overflow = "hidden"
        ..style.borderRadius = "15px";
      document.body.append(container);

      graph = new DivElement();
      graph
        ..id = "simPlotQuad"
        ..style.width = "1400px"
        ..style.margin = "0 auto"
        ..style.overflow = "hidden";
      container.nodes.add(graph);

    });

    // When done, remove the outer container.
    tearDown((){
      container.remove();
    });

    test('Calling plot() with no arguments throws ArgumentError()', () {
      // testing...
      logMessage('New ArgumentError() thrown.');
      // why does this not work?
      expect( () => plot(), throwsArgumentError );
    });
  });
}
