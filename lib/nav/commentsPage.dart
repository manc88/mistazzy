import 'package:flutter/material.dart';
import 'package:mistazzy/models/comment.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/widgets/commentTile.dart';
import 'package:mistazzy/widgets/drawer.dart';

class CommentsPage extends StatefulWidget {
  final Topic topic;
  CommentsPage(this.topic);
  @override
  _CommentsPageState createState() {
    return new _CommentsPageState();
  }
}

class _CommentsPageState extends State<CommentsPage> {
  List<Comment> _commentsList;

  Topic topic;

  @override
  void initState() {
    topic = widget.topic;
    _commentsList = topic.comments;
    super.initState();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    //return CommentTile(_commentsList[index], _commentsList[index].answeredTo);
    return MyCommentTile(_commentsList[index], _commentsList[index].answeredTo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Комментарии"),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: _commentsList.length,
          itemBuilder: _itemBuilder,
        ));
  }
}
