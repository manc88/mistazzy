import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/widgets/topicCard.dart';

class TopicList extends StatefulWidget {
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  List<Topic> _topicList = <Topic>[];
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  int _lastTopicTime;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this._loadData();
      }
    });
    this._loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      var res = await Topic.getList(utime: _lastTopicTime);
      setState(() {
        _topicList.addAll(res);
        isPerformingRequest = false;
        _lastTopicTime = (_topicList
                .map((f) => f.updated.millisecondsSinceEpoch)
                .reduce(min) ~/
            1000);
      });
    }
  }

  Widget _buildListItem(BuildContext cont, int index) {
    if (index == _topicList.length) {
      return _buildProgressIndicator();
    } else {
      return TopicCard(_topicList[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: _buildListItem,
          itemCount: _topicList == null ? 0 + 1 : _topicList.length + 1,
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
