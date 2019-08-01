import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';

main() async {
  var app = Angel();
  var http = AngelHttp(app);

  app.get('/', (req, res) => res.write('Hello, world!'));

  app.post('/tor_onions', echoPost);
  
  await http.startServer('localhost', 3000);
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