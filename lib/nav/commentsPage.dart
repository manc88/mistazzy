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
  Topic topic;
  ScrollController _scrollController = new ScrollController();

  void loadData() async {
    await topic.loadComments();

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    topic = widget.topic;
    setState(() {
      _loading = !topic.commentsLoaded;
    });
    if (_loading) {
      loadData();
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return MyCommentTile(topic.comments[index], topic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Комментарии"),
      ),
      drawer: AppDrawer(),
      body: _buildListView(),
      //floatingActionButton: _buildFOAB(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (int index) => _navBarOnTap(index, context),
      fixedColor: Colors.blueGrey,
      iconSize: 32.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_upward),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_downward),
          title: Container(),
        )
      ],
    );
  }

  void _navBarOnTap(int i, BuildContext cnt) {
    switch (i) {
      case 0:
        _jumpUpward();
        break;
      case 1:
        _jumpDownward();
    }
  }

  Widget _buildListView() {
    if (!_loading) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: topic.comments.length,
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
                onPressed: _scrollUpward,
              ),
              FloatingActionButton(
                backgroundColor: Colors.blueGrey,
                heroTag: null,
                mini: true,
                child: Icon(Icons.arrow_downward),
                onPressed: _scrollDownward,
              ),
            ],
          );
  }

  void _scrollDownward() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _jumpDownward() {
    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
  }

  void _jumpUpward() {
    _scrollController.jumpTo(
      0.0,
    );
  }

  void _scrollUpward() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
