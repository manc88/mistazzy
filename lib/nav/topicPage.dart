import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/paginator.dart';
import 'package:mistazzy/widgets/topicCard.dart';

class TopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic 0"),
      ),
      body: Container(child: TopicCard(Topic.testList()[0])),
      bottomNavigationBar: Container(
        height: 50.0,
        child: ButtonBar(children: <Widget>[
          FlatButton(
              onPressed: () => Paginator.pop(context),
              child: Icon(
                Icons.home,
                size: 32.0,
              )),
          FlatButton(onPressed: () => {}, child: Icon(Icons.chat, size: 32.0)),
          FlatButton(onPressed: () => {}, child: Icon(Icons.create, size: 32.0))
        ]),
      ),
    );
  }
}
