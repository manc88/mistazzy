import 'package:mistazzy/api/URLS.dart' as URLS;
import 'package:mistazzy/api/Network.dart' as API;
import 'package:mistazzy/models/Forum.dart';

void main() async {
  var uri = URLS.topicsList(forum: Forum.life);
  var res = await API.execute(uri);
  print(res);
}
