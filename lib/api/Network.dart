import 'dart:async';

import 'package:http/http.dart' as http;

Future<String> execute(Uri uri) async {
  var response = await http.get(uri);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    return "";
  }
}
