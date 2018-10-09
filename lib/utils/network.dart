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

// Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
// Accept-Encoding: gzip, deflate, br
// Accept-Language: ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7
// Cache-Control: max-age=0
// Connection: keep-alive
// Host: www.forum.mista.ru
// Upgrade-Insecure-Requests: 1
// User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36
// X-Compress: null

Map<String, String> _headers = {
  "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
  "Accept-Encoding": "gzip, deflate, br",
  "Accept-Language": "ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7",
  "Cache-Control": "max-age=0",
  "Connection": "keep-alive",
  "Host": "www.forum.mista.ru",
  "Upgrade-Insecure-Requests": "1",
  "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",
  "X-Compress": "null"
};
