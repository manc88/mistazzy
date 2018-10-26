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
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    topic = widget.topic;
    _commentsList = topic.comments;
    super.initState();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    //return CommentTile(_commentsList[index], _commentsList[index].answeredTo);
    return MyCommentTile(_commentsList[index], topic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Комментарии"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _commentsList.length,
        itemBuilder: _itemBuilder,
      ),
      floatingActionButton: _buildFOAB(),
    );
  }

  Column _buildFOAB() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          heroTag: null,
          mini: true,
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            _scrollController.animateTo(
              _scrollController.position.minScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
        FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          heroTag: null,
          mini: true,
          child: Icon(Icons.arrow_downward),
          onPressed: () {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
      ],
    );
  }
}
