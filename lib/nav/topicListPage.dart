import 'package:flutter/material.dart';
import 'package:mistazzy/utils/Strings.dart';
import 'package:mistazzy/widgets/size.dart';
import '../widgets/topicList.dart';

class TopicListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(Strings.appName),
      ),
      body: TopicList(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(
          Icons.create,
          size: Foab.icon,
          color: Colors.white70,
        ),
        onPressed: () => print('foab'),
        elevation: 8.0,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
