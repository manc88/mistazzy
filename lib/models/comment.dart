class Comment {
  String id;

  String text;

  int n;

  String user;

  String userId;

  DateTime utime;

  int vote;

  Comment(this.n, this.user, this.text);

  Comment.fromJson(Map<String, dynamic> props) {
    if (props.isEmpty) {
      throw ArgumentError();
    }

    RegExp regExp = new RegExp(
      r"\([0-9]{1,3}\)",
      caseSensitive: false,
      multiLine: false,
    );

    String rawText = props['text'].replaceAllMapped(
        regExp,
        (match) =>
            "<a href=mistazylink${match.group(0).replaceAll(RegExp(r'\('), "").replaceAll(RegExp(r'\)'), "")}> (${match.group(0).replaceAll(RegExp(r'\('), "").replaceAll(RegExp(r'\)'), "")}) </a>");

    //this.text = html2md.convert(rawText.trim());
    this.text = rawText;
    this.id = props['id'];
    this.n = int.parse(props['n']);
    this.user = props['user'];
    this.userId = props['userId'];
    this.utime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(props['utime']) * 1000);
  }
}
