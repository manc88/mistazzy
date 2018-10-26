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
    return _CommentsPageState();
  }
}

class _CommentsPageState extends State<CommentsPage> {
  bool _loading = true;
  List<Comment> _commentsList;
  Topic topic;
  ScrollController _scrollController = new ScrollController();

  void loadData() async {
    await topic.loadComments();
    _commentsList = topic.comments;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    topic = widget.topic;
    _commentsList = topic.comments;
    setState(() {
      _loading = !topic.commentsLoaded;
    });
    if (_loading) {
      loadData();
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return MyCommentTile(_commentsList[index], topic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Комментарии"),
      ),
      drawer: AppDrawer(),
      body: _buildListView(),
      floatingActionButton: _buildFOAB(),
    );
  }

  Widget _buildListView() {
    if (!_loading) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: _commentsList.length,
        itemBuilder: _itemBuilder,
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)),
      );
    }
  }

  Widget _buildFOAB() {
    return _loading
        ? Container()
        : Column(
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
