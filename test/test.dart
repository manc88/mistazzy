import 'package:mistazzy/api/urls.dart' as URLS;
import 'package:mistazzy/api/network.dart' as API;
import 'package:mistazzy/models/forum.dart';

void main() async {
  var uri = URLS.topicsList(forum: Forum.life);
  var res = await API.execute(uri);
  print(res);
}
