// Copyright (c) 2013, scribeGriff (Richard Griffith)
// https://github.com/scribeGriff/simplot
// All rights reserved.  Please see the LICENSE.md file.

/**
 * An example of plotting data retrieved from a websocket using the simplot library.
 *
 * The following script (or something similar) would reside on a server
 * (or local host) to read in the data from a file and add it to a websocket:
 *
 *     import 'dart:async';
 *     import 'dart:io';
 *     import 'dart:json' as json;
 *     import 'dart:convert';
 *
 *     void main() {
 *     //Path to external file.
 *     String filename = '../../lib/external/data/sound4.txt';
 *     var host = 'local';
 *     var port = 8080;
 *     List data = [];
 *     Stream stream = new File(filename).openRead();
 *     stream
 *       .transform(UTF8.decoder)
 *       .transform(new LineSplitter())
 *       .listen((String line) {
 *         if (line.isNotEmpty) {
 *           data.add(double.parse(line.trim()));
 *         }
 *       },
 *       onDone: () {
 *         //connect with ws://localhost:8080/ws
 *         if (host == 'local') host = '127.0.0.1';
 *         HttpServer.bind(host, port).then((server) {
 *           print('Opening connection at $host:$port');
 *           server.transform(new WebSocketTransformer()).listen((WebSocket webSocket) {
 *           webSocket.listen((message) {
 *             var msg = json.parse(message);
 *             print("Received the following message: \n"
 *                 "${msg["request"]}\n${msg["date"]}");
 *             webSocket.add(JSON.encode(data));
 *           },
 *           onDone: () {
 *             print('Connection closed by client: Status - ${webSocket.closeCode}'
 *             ' : Reason - ${webSocket.closeReason}');
 *             server.close();
 *           });
 *         });
 *       });
 *     },
 *     onError: (e) {
 *       print('There was an error: $e');
 *     });
 *  }
 *
 *  Once the data has been added to the websocket, the following would be an
 *  example of retrieving the data and plotting it to a browser window.
 *
 */

library simplot_example_ws;

import 'dart:html';
import 'dart:async';
import 'package:simplot/simplot.dart';

void main() {
  String host = 'local';
  int port = 8080;
  var myDisplay = querySelector('#console');
  var myMessage = 'Send data request';
  Future reqData = requestDataWS(host, port, message:myMessage,
      display:myDisplay);
  reqData.then((data) {
    var sndLength = data.length;
    var sndRate = 22050;
    var sndSample = sndLength / sndRate * 1e3;
    var xtime = new List.generate(sndLength, (var index) =>
        index / sndRate * 1e3, growable:false);

    var wsCurve = plot(data, xdata:xtime, style1:'curve', color1:'green',
        linewidth:3);
    wsCurve
      ..grid()
      ..title('Sound Sample from Server')
      ..xlabel('time (ms)')
      ..ylabel('amplitude')
      ..save();
  });
}