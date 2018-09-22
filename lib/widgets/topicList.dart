import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';

import 'package:mistazzy/widgets/topicCard.dart';

class TopicList extends StatefulWidget {
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  List<Topic> _topicList = Topic.testList();

  Widget _buildList(BuildContext cont, int index) {
    return TopicCard(_topicList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: ListView.builder(
          itemBuilder: _buildList,
          itemCount: _topicList.length,
        ),
      ),
    );
  }
}
