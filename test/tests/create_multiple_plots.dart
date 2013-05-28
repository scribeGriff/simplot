// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 * Testing the creation of multiple canvas plotting elements.
 */

void createMultiplePlots() {
  logMessage('Creating multiple plots to canvas.');

  group('Creating multiple plots:', () {
    DivElement container, graph;
    var simpleList = [6, 12, 14, 3.4, 62, 47, 19, 0.3, -14, 0];

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

    test('Calling plot() with no arguments throws NoSuchMethodError()', () {
      logMessage('Expect New NoSuchMethodError() thrown.');
      expect(() => plot(), throwsNoSuchMethodError);
    });
    test('Calling plot() with an empty array throws ArgumentError()', () {
      logMessage('Expect New Argument Error() thrown.');
      expect(() => plot([]), throwsArgumentError);
    });
    test('Calling plot() 4 times with a simple list: Check for four children in container', () {
      logMessage('Add 4 simple plots to the graph div and check for four children.');
      plot(simpleList, range:4, index:1);
      plot(simpleList, range:4, index:2);
      plot(simpleList, range:4, index:3);
      plot(simpleList, range:4, index:4);
      expect(graph.children.length, equals(4));
    });
    test('Calling plot() 4 times with a simple list: Check that all have canvas tag', () {
      logMessage('Add 4 simple plots to the graph div and check all children have canvas tag.');
      plot(simpleList, range:4, index:1);
      plot(simpleList, range:4, index:2);
      plot(simpleList, range:4, index:3);
      plot(simpleList, range:4, index:4);
      expect(graph.children.every((child) => child.tagName == "CANVAS"), equals(true));
    });
    test('Calling plot() 4 times with a simple list: Check for proper ID', () {
      logMessage('Now checking for simplot[1-4] ID.');
      var expected = ["simPlot1", "simPlot2", "simPlot3", "simPlot4"];
      plot(simpleList, range:4, index:1);
      plot(simpleList, range:4, index:2);
      plot(simpleList, range:4, index:3);
      plot(simpleList, range:4, index:4);
      var ids = graph.children.map((child) => child.id).toList();
      expect(ids, equals(expected));
    });
    test('Calling plot() 4 times with a simple list: Check for proper class', () {
      logMessage('Now checking for simPlot class.');
      plot(simpleList, range:4, index:1);
      plot(simpleList, range:4, index:2);
      plot(simpleList, range:4, index:3);
      plot(simpleList, range:4, index:4);
      expect(graph.children.every((child) => child.classes.contains("simPlot")), equals(true));
    });
    test('Calling plot() 4 times with a simple list: Check for proper width', () {
      logMessage('Now checking for plot width.');
      plot(simpleList, range:4, index:1);
      plot(simpleList, range:4, index:2);
      plot(simpleList, range:4, index:3);
      plot(simpleList, range:4, index:4);
      expect(graph.children.every((child) => child.width == 600), equals(true));
    });
    test('Calling plot() 4 times with a simple list: Check for proper height', () {
      logMessage('Now checking for plot height.');
      plot(simpleList, range:4, index:1);
      plot(simpleList, range:4, index:2);
      plot(simpleList, range:4, index:3);
      plot(simpleList, range:4, index:4);
      expect(graph.children.every((child) => child.height == 450), equals(true));
    });
  });
}
