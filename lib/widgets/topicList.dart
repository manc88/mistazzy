import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';

import 'package:mistazzy/widgets/topicCard.dart';

class TopicList extends StatefulWidget {
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  List<Topic> _topicList = Topic.testList();

  List<Widget> buildList() {
    return _topicList.map((t) => TopicCard(t)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buildList(),
    );
  }
}
