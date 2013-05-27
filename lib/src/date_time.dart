// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/ConvoWeb
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 * A class for adding a time stamp.
 *
 * Method stamp([bool short = false]) returns a string for use as a time stamp.
 *
 * This class is instantiated using the date() method of the top level
 * plot() function.
 *
 * Usage:
 *     var myPlot = plot(data);
 *     myPlot.date();
 */

class TimeStamp {

  HashMap _months = new HashMap();
  HashMap _weekdays = new HashMap();
  DateTime _currentTime = new DateTime.now();
  int _year, _month, _day, _hour, _minute, _weekday;

  TimeStamp() {
    _year = _currentTime.year;
    _month = _currentTime.month;
    _day = _currentTime.day;
    _hour = _currentTime.hour;
    _minute = _currentTime.minute;
    _weekday = _currentTime.weekday;

    _months[1] = 'Jan';
    _months[2] = 'Feb';
    _months[3] = 'Mar';
    _months[4] = 'Apr';
    _months[5] = 'May';
    _months[6] = 'Jun';
    _months[7] = 'Jul';
    _months[8] = 'Aug';
    _months[9] = 'Sep';
    _months[10] = 'Oct';
    _months[11] = 'Nov';
    _months[12] = 'Dec';

    _weekdays[1] = 'Mon';
    _weekdays[2] = 'Tue';
    _weekdays[3] = 'Wed';
    _weekdays[4] = 'Thu';
    _weekdays[5] = 'Fri';
    _weekdays[6] = 'Sat';
    _weekdays[7] = 'Sun';
  }

  String stamp([bool short = false]) {
    String timeStamp;
    String meridian;
    String minutes = _minute < 10 ? '0$_minute' : '$_minute';

    if (_hour >= 12) {
      if (_hour > 12) _hour -= 12;
      meridian = 'pm';
    } else {
      meridian = 'am';
    }

    if (short) {
      return timeStamp = '$_hour:$minutes$meridian $_month/$_day/$_year';
    } else {
      return timeStamp = '$_hour:$minutes$meridian ${_weekdays[_weekday]} '
          '$_day-${_months[_month]}-$_year';
    }
  }
}
