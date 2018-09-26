import 'package:flutter/material.dart';

import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/paginator.dart';
import 'package:mistazzy/utils/DT.dart';
import 'package:mistazzy/widgets/size.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;

  TopicCard(this.topic);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UpperTopic(topic),
          Divider(),
          _TopicTitle(topic: topic),
          _TopicBottom(topic: topic)
        ],
      ),
    );
  }
}

class UpperTopic extends StatelessWidget {
  final Topic topic;

  UpperTopic(this.topic);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6.0, 4.0, 4.0, 2.0),
      margin: EdgeInsets.all(2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: [
            Icon(
              Icons.account_box,
              size: TopicCardSize.icon,
              color: Colors.black87,
            ),
            Spacer(2),
            Text(topic.user.name,
                style: TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.normal,
                    fontSize: TopicCardSize.iconText,
                    fontWeight: FontWeight.bold))
          ]),
          Text(
            Dt.topicDate(topic.created),
            style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: TopicCardSize.iconText,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _TopicTitle extends StatelessWidget {
  final Topic topic;

  _TopicTitle({this.topic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(2.0),
          padding: EdgeInsets.fromLTRB(6.0, 2.0, 4.0, 2.0),
          child: GestureDetector(
              onTap: () async {
                await topic.loadFull();
                Paginator.goToTopic(context, topic);
              },
              child: Text(topic.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: TopicCardSize.titleText,
                    color: Colors.blueGrey,
                  ))),
        ),
      ],
    );
  }
}

class _TopicBottom extends StatelessWidget {
  final Topic topic;

  _TopicBottom({this.topic});

  Widget votePic() {
    return topic.isVoting
        ? Icon(Icons.assessment, size: TopicCardSize.icon, color: Colors.grey)
        : Spacer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2.0),
        padding: EdgeInsets.fromLTRB(6.0, 2.0, 4.0, 2.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        topic.forum,
                        style: TextStyle(
                            fontSize: TopicCardSize.iconText,
                            color: Colors.grey),
                      ),
                      Spacer(2),
                      votePic()
                    ],
                  )
                ],
              ),
              Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.chat,
                      size: TopicCardSize.icon,
                      color: Colors.black87,
                    ),
                    Spacer(2),
                    Text(topic.answersCount.toString(),
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: TopicCardSize.iconText))
                  ],
                )
              ])
            ]));
  }
}

class Spacer extends StatelessWidget {
  final int _width;

  const Spacer(
    this._width, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: _width.toDouble());
  }
}
