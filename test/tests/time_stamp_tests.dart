// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplottests;

/**
 * Unit testing of time stamp for simplot library.
 */

void timeStampTests() {
  logMessage('Performing time stamp tests.');

  group('Test time stamp String:', () {
    test('Create new time stamp in long form, expect it ends with current year', () {
      expect(new TimeStamp().stamp(), endsWith(new DateTime.now().year.toString()));
    });
    test('Create new time stamp in short form, expect it ends with current year', () {
      expect(new TimeStamp().stamp(true), endsWith(new DateTime.now().year.toString()));
    });
  });
}
