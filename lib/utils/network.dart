import 'dart:async';

import 'package:http/http.dart' as http;

Future<String> httpGet(Uri uri) async {
  var response = await http.get(uri, headers: _headers);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return null;
  }
}

Map<String, String> _headers = {};
