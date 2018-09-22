import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';

import 'package:mistazzy/widgets/topicCard.dart';

class TopicList extends StatefulWidget {
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  List<Topic> _topicList;

  @override
  void initState() {
    super.initState();
    this._loadData();
  }

  Future<void> _loadData() async {
    var res = await Topic.getList();
    setState(() {
      _topicList = res;
    });
  }

  Widget _buildListItem(BuildContext cont, int index) {
    return TopicCard(_topicList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: ListView.builder(
          itemBuilder: _buildListItem,
          itemCount: _topicList == null ? 0 : _topicList.length,
        ),
      ),
    );
  }
}
