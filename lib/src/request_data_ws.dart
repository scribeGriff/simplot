// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

part of simplot;

/**
 *   Connect to a server through a websocket to retrieve data for plotting.
 *   Usage:
 *     String host = 'local';
 *     int port = 8080;
 *     var myDisplay = query('#console');
 *     var myMessage = 'Send data request';
 *     Future reqData = requestDataWS(host, port, message:myMessage,
 *         display:myDisplay);
 *     reqData.then((data) {
 *       plot(data);
 *     });
 *
 */

Future requestDataWS(String host, int port, {String message:'Please send data.',
      Element display:null}) {
  Completer _c = new Completer();
  if (host == 'local') host = '127.0.0.1';
  WebSocket _ws = new WebSocket('ws://$host:$port/ws');

  if (display != null) {
    display.appendHtml('Opening connection at $host:$port<br/>');
  }
  _ws.onOpen.listen((Event opn) {
    DateTime sent = new DateTime.fromMillisecondsSinceEpoch(opn.timeStamp);
    String request = json.stringify({"request": message, "date": '$sent'});
    _ws.send(request);
  });

  _ws.onClose.listen((CloseEvent cls) {
    if (display != null) {
      if (cls.wasClean) {
        display.appendHtml('Connection closed satisfactorily.<br/>');
      } else {
        display.appendHtml('Connection closed but an error occurred.<br/>');
      }
    }
  });

  _ws.onError.listen((ErrorEvent err) {
    if (display != null) {
      display.appendHtml('There was an error with the connection: ${err.message}<br/>');
    }
    _c.complete(null);
  });

  _ws.onMessage.listen((MessageEvent msg) {
    var data = json.parse(msg.data);
    if (display != null) {
      display.appendHtml('Successfully received data from the server. <br/>');
    }
    _ws.close(1000, 'Got the data.  Thanks!');
    _c.complete(data);
  });

  return _c.future;
}
