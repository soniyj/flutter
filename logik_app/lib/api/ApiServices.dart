import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {

  String serverUrl = "https://api.humlive.co.uk";
  var status;
  var token;

  // OK works
  login(String email, String password) async {
    print('login');

    String myUrl = "$serverUrl/auth/login";
    print('url: $myUrl');
    
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'},
        body: {"email": "$email", "password": "$password"});
    
    status = response.body.contains('error');
    print('status: $status');

    var data = json.decode(response.body);
    print('data: $data');

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      // _save(data["token"]);
    }
  }

}
