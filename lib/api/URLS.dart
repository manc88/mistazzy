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
  var uri = new Uri.http(BASE, TOPIC_LIST);
  if (topics != 0) {
    uri.queryParameters["topics"] = topics.toString();
  }

  if (utime != null) {
    uri.queryParameters["utime"] = utime.millisecondsSinceEpoch.toString();
  }

  if (forum != null) {
    uri.queryParameters["forum"] = forum.toString().split(".")[1];
  }

  if (section != null) {
    uri.queryParameters["section"] = section;
  }

  if (mytopics) {
    uri.queryParameters["mytopics"] = (mytopics ? 1 : 0).toString();
  }

  if (user != null) {
    uri.queryParameters["user"] = user.id;
  }

  return uri;
}
