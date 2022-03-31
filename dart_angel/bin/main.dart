import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';

import 'dart:io';
import 'package:ftpconnect/ftpConnect.dart';

main() async {
  var app = Angel();
  var http = AngelHttp(app);

  app.get('/', (req, res) => res.write('Hello, world!'));

  app.post('/tor_onions', echoPost);

  app.get('/zxc', ftptest);
  
  // await http.startServer('localhost', 3000);
  await http.startServer('0.0.0.0', 3000);
  print("Angel server listening at ${http.uri}");
}

echoPost(RequestContext<dynamic> req, ResponseContext<dynamic> res) async {
  await req.parseBody();

  var obj = req.bodyAsMap;

  if (obj == null) {
    throw AngelHttpException.badRequest(message: 'Bad request.');
  } else {
    var now = DateTime.now();
    obj['echo_now'] = now;
    res.write(obj);
    // res.writeln();
  }
}

oldtest(res, req) async {
  await req.parseBody();
  var name = req.bodyAsMap['name'] as String;

  if (name == null) {
      throw AngelHttpException.badRequest(message: 'Missing name.');
  } else {
      res.write('Hello, $name!');
      res.writeln();
      // Prints the whole object
      res.write(req.bodyAsMap);
      res.writeln();
  }
}

ftptest(res, req) async {
  // await req.parseBody();

  FTPConnect ftpConnect = FTPConnect('ftp.server', port: 1587, user: 'username', pass:'password');
  try {
      String fileName = 'FILE.TXT';
      // res.write('Connecting...');
      print('Connecting...');
      await ftpConnect.connect();
      print('Downloading...');
      await ftpConnect.downloadFile(fileName, File('FILE.TXT'));
      // res.write('Connecting...');
      print('Disconect...');
      await ftpConnect.disconnect();
  } catch (e) {
      // res.write('Ops: Error');
      print("Error");
      print(e);
  }
}