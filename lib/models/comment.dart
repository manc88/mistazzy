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

    this.id = props['id'];
    this.text = props['text'];
    this.n = int.parse(props['n']);
    this.user = props['user'];
    this.userId = props['userId'];
    this.utime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(props['utime']) * 1000);
  }
}
