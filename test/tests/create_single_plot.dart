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
    test('Calling plot() with a simple list: Check for a single child in container', () {
      logMessage('Add simple plot to the graph div and check for a single child.');
      plot(simpleList);
      expect(graph.children.length, equals(1));
    });
    test('Calling plot() with a simple list: Check for proper tag', () {
      logMessage('Add simple plot to the graph div and check for canvas tag.');
      plot(simpleList);
      expect(graph.children[0].tagName, equals("CANVAS"));
    });
    test('Calling plot() with a simple list: Check for proper ID', () {
      logMessage('Now checking for simplot1 ID.');
      plot(simpleList);
      expect(graph.children[0].id, equals("simPlot1"));
    });
    test('Calling plot() with a simple list: Check for proper class', () {
      logMessage('Now checking for simPlot class.');
      plot(simpleList);
      expect(graph.children[0].classes.contains("simPlot"), equals(true));
    });
    test('Calling plot() with a simple list: Check for proper width', () {
      logMessage('Now checking for plot width.');
      plot(simpleList);
      expect(graph.children[0].width, equals(600));
    });
    test('Calling plot() with a simple list: Check for proper height', () {
      logMessage('Now checking for plot height.');
      plot(simpleList);
      expect(graph.children[0].height, equals(600));
    });
    // Not sure if this is the proper way to do this, but want to test that
    // the public methods execute without error.  Does this do that?
    test('Calling plot() with a simple list: Add a grid()', () {
      logMessage('Now adding a grid.');
      expect(() => plot(simpleList).grid(), isNot(throwsNoSuchMethodError));
    });
    test('Calling plot() with a simple list: Add an xlabel() missing arguments', () {
      logMessage('Now adding a label to the x axis missing arguments.');
      expect(() => plot(simpleList).xlabel(), throwsNoSuchMethodError);
    });
    test('Calling plot() with a simple list: Add an xlabel() with required String label', () {
      logMessage('Now adding a label to the x axis with required String label.');
      expect(() => plot(simpleList).xlabel(''), isNot(throwsNoSuchMethodError));
    });
    test('Calling plot() with a simple list: Add a ylabel() missing arguments', () {
      logMessage('Now adding a label to the y axis missing arguments.');
      expect(() => plot(simpleList).ylabel(), throwsNoSuchMethodError);
    });
    test('Calling plot() with a simple list: Add a ylabel() with required String label', () {
      logMessage('Now adding a label to the y axis with required String label.');
      expect(() => plot(simpleList).ylabel(''), isNot(throwsNoSuchMethodError));
    });
    test('Calling plot() with a simple list: Add a title() missing arguments', () {
      logMessage('Now adding a title missing arguments.');
      expect(() => plot(simpleList).title(), throwsNoSuchMethodError);
    });
    test('Calling plot() with a simple list: Add a title() with required String label', () {
      logMessage('Now adding a title with required String label.');
      expect(() => plot(simpleList).title(''), isNot(throwsNoSuchMethodError));
    });
    test('Calling plot() with a simple list: Add a date()', () {
      logMessage('Now adding a date stamp.');
      expect(() => plot(simpleList).date(), isNot(throwsNoSuchMethodError));
    });
  });
}