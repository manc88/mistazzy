// import 'package:html_unescape/html_unescape.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/utils/network.dart';
import 'package:mistazzy/utils/urls.dart';
import 'dart:convert' as converter;

void main() async {
  var uri1 = getTopicsList(topics: 10);
  var res = await httpGet(uri1);
  Iterable i = converter.jsonDecode(res);
  List<Topic> lst = i.map((item) => Topic.fromPreview(item)).toList();
  //lst.map((f) => print(f));
  print(lst[1]);

  var uri2 = getTopic(lst[1]);
  var res2 = await httpGet(uri2);
  Map<String, dynamic> props = converter.jsonDecode(res2);
  print(props);
}
