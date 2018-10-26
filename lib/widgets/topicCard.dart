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
            SizedBox(width: 2.0),
            Text(topic.user.name,
                style: TextStyle(
                    //color: Colors.black87,
                    fontStyle: FontStyle.normal,
                    fontSize: TopicCardSize.iconText,
                    fontWeight: FontWeight.bold))
          ]),
          Text(
            Dt.topicDate(topic.created),
            style: TextStyle(
                //color: Colors.grey,
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
              onTap: () {
                //await topic.loadFull();
                Paginator.goToTopic(context, topic);
              },
              child: Text(topic.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: TopicCardSize.titleText,
                    color: Theme.of(context).primaryColor,
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
        : Container();
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
                        style: Theme.of(context).textTheme.display1,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      votePic()
                    ],
                  )
                ],
              ),
              Column(children: <Widget>[ChatIcon(topic)])
            ]));
  }
}

class ChatIcon extends StatelessWidget {
  final Topic topic;

  ChatIcon(this.topic);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Paginator.goToTopicComments(context, topic);
      },
      child: Stack(
        alignment: const Alignment(0.0, -0.3),
        children: <Widget>[
          Icon(
            Icons.chat_bubble,
            size: 30.0,
            color: Colors.grey,
          ),
          Text(topic.answersCount.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: topic.answersCount > 999 ? 12.0 : 14.0))
        ],
      ),
    );
  }
}
