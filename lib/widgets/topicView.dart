import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/widgets/size.dart';
import 'package:mistazzy/widgets/topicCard.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TopicView extends StatelessWidget {
  final Topic topic;

  TopicView({this.topic});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UpperTopic(topic),
        Divider(),
        TopicTitle(topic),
        // Divider(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: MarkdownBody(
              styleSheet: MarkdownStyleSheet(
                  p: TextStyle(color: Colors.black87, fontSize: 18.0),
                  a: TextStyle(background: new Paint()..color = Colors.lime)),
              //TODO URL LAUNCHER
              onTapLink: (item) => print(item),
              data: topic.text,
            ),
          ),

          //Text(
          //   topic.text,
          //   style: TextStyle(fontSize: TopicSize.bodyText),
          // ),
        ),
      ],
    );
  }
}

class TopicTitle extends StatelessWidget {
  final Topic topic;
  TopicTitle(this.topic);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(topic.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: TopicCardSize.titleText,
                    color: Colors.blueGrey,
                  )),
            ),
          ),
        ]);
  }
}
