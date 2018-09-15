import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';

import 'package:mistazzy/ui/topicCard.dart';
import 'package:test/test.dart';

class TopicList extends StatefulWidget {
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  List<Topic> _topicList = Topic.testList();

  List<Widget> buildList() {
    for (var item in _topicList) {
      print(item.toString());
      print("-----------");
    }
    return _topicList.map((t) => TopicCard(t)).toList();
    //return ['1', '2', '3'].map((f) => Text(f)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: buildList(),
      ),
    );
  }
}
