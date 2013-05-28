// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 * Unit testing of time stamp for simplot library.
 */

void timeStampTests() {
  logMessage('Performing time stamp tests.');

  group('Test time stamp String:', () {
    // Need to consider replacing most of these with a couple of better RegExs.
    test('Create new time stamp in long form, expect it ends with current year', () {
      expect(new TimeStamp().stamp(), endsWith(new DateTime.now().year.toString()));
    });
    test('Create new time stamp in short form, expect it ends with current year', () {
      expect(new TimeStamp().stamp(true), endsWith(new DateTime.now().year.toString()));
    });
    test('Create new time stamp in short form, expect it contains current month in numerical form', () {
      expect(new TimeStamp().stamp(true), contains(new DateTime.now().month.toString()));
    });
    test('Create new time stamp in short form, expect it contains current day in numerical form', () {
      expect(new TimeStamp().stamp(true), contains(new DateTime.now().day.toString()));
    });
    test('Create new time stamp in short form, expect it matches format mm/dd/year', () {
      expect(new TimeStamp().stamp(true), stringContainsInOrder([new DateTime.now().month.toString(),
                                                                 new DateTime.now().day.toString(),
                                                                 new DateTime.now().year.toString()]));
    });
    test('Create new time stamp in long form, expect it contains either am or pm', () {
      expect(new TimeStamp().stamp(), anyOf(contains("am"), contains("pm")));
    });
    test('Create new time stamp in short form, expect it contains either am or pm', () {
      expect(new TimeStamp().stamp(true), anyOf(contains("am"), contains("pm")));
    });
    test('Create new time stamp in long form, expect it begins with a number', () {
      expect(new TimeStamp().stamp(), matches("^[0-9]"));
    });
    test('Create new time stamp in short form, expect it begins with a number', () {
      expect(new TimeStamp().stamp(true), matches("^[0-9]"));
    });
    test('Create new time stamp in long form, expect it contains a dash', () {
      expect(new TimeStamp().stamp(), contains("-"));
    });
    test('Create new time stamp in short form, expect it contains a slash', () {
      expect(new TimeStamp().stamp(true), contains("/"));
    });
    test('Create new time stamp in long form, expect it does not contain a slash', () {
      expect(new TimeStamp().stamp(), isNot(contains("/")));
    });
    test('Create new time stamp in short form, expect it does not contain a dash', () {
      expect(new TimeStamp().stamp(true), isNot(contains("-")));
    });
  });
}
