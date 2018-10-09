import 'package:html2md/html2md.dart' as html2md;

class Comment {
  String id;
  String text;
  int n;
  String user;
  String userId;
  DateTime utime;
  int vote;
  Comment answeredTo;

  Comment(this.n, this.user, this.text);

  Comment.fromJson(Map<String, dynamic> props) {
    if (props.isEmpty) {
      throw ArgumentError();
    }

    this.text = html2md.convert(props['text']);
    this.id = props['id'];
    this.n = int.parse(props['n']);
    this.user = props['user'];
    this.userId = props['userId'];
    this.utime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(props['utime']) * 1000);
  }
}
