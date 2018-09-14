import 'package:mistazzy/api/URLS.dart' as URLS;
import 'package:mistazzy/api/Network.dart' as API;

void main() async {
  var uri = URLS.topicsList();

  var res = await API.execute(uri);

  print(res);
}
