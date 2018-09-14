import 'package:mistazzy/models/Forum.dart';
import 'package:mistazzy/models/User.dart';

const String BASE = "forum.mista.ru";
const String TOPIC_GET = "ajax_gettopic.php";
const String TOPIC_LIST = "api/topic.php";
const String TOPIC_MESSAGES = "api/message.php";
const String USERS = "api/users.php";
const String LOGIN = "ajax_login.php";

Uri topicsList(
    {int topics = 0,
    DateTime utime,
    Forum forum,
    String section,
    bool mytopics = false,
    User user}) {
  var params = new Map<String, String>();

  if (topics != 0) {
    params["topics"] = topics.toString();
  }

  if (utime != null) {
    params["utime"] = utime.millisecondsSinceEpoch.toString();
  }

  if (forum != null) {
    params["forum"] = forum.toString().split(".")[1];
  }

  if (section != null) {
    params["section"] = section;
  }

  if (mytopics) {
    params["mytopics"] = (mytopics ? 1 : 0).toString();
  }

  if (user != null) {
    params["user"] = user.id;
  }

  return new Uri(
      scheme: 'https', host: BASE, path: TOPIC_LIST, queryParameters: params);
}
