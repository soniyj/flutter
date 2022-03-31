import 'dart:convert';
import 'dart:io';
// import 'dart:html';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';

main() async {
  var app = Angel();
  var http = AngelHttp(app);

  app.get('/', (req, res) => res.write('Hello, world!'));

  app.post('/tor_onions', echoPost);

  app.get('/qwerty', qwertyGet);
  app.post('/qwerty', qwertyPost);
  
  // await http.startServer('localhost', 3000);
  await http.startServer('0.0.0.0', 3000);
  print('Angel server listening at ${http.uri}');
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

qwertyGet(RequestContext<dynamic> req, ResponseContext<dynamic> res) async {
  // var request = await HttpClient().getUrl(Uri.parse(url)); // produces a request object
  // var response = await request.close(); // sends the request
  
  // // transforms and prints the response
  // await for (var contents in response.transform(Utf8Decoder())) {
  //   print(contents);
  // }
  // print('marco');

  await req.parseBody();

  print(req);

  var name = req.bodyAsMap['name'] as String;
  var user = req.bodyAsMap['user'] as String;

  print(name);
  print(user);
}

// OK it works
qwertyPost(RequestContext<dynamic> req, ResponseContext<dynamic> res) async {
  var url = 'http://your.amazing.api/graphql'; //OR Rest

  Map jsonData = {
    'data_1': 'ABC1234567',
    'data_2': 'TYPO'
  };

  var request = await  HttpClient().postUrl(Uri.parse(url));
  request.headers.contentType = ContentType.json;
  request.write(jsonEncode(jsonData));
  var response = await request.close(); // sends the request

  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    print(contents);
    final body = jsonDecode(contents);
    print(body);
    if (body['status']=='SUCCESS') {
      print('YEs');
    }
  }
}
