import 'package:flutter/material.dart';

import 'package:mistazzy/models/user.dart';
import 'package:mistazzy/models/topic.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;

  TopicCard(this.topic);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          _UpperTopicRow(
            user: topic.user,
            topicTime: topic.created,
          ),
          _TopicTitleRow(
            title: topic.text,
          ),
          _TopicBottomRow(
              answersCount: topic.answersCount,
              isVoting: topic.isVoting,
              forum: topic.forum)
        ],
      ),
    );
  }
}

class _UpperTopicRow extends StatelessWidget {
  final DateTime topicTime;
  final User user;

  _UpperTopicRow({this.topicTime, this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          topicTime.toString(),
          style: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontSize: 10.0,
              fontWeight: FontWeight.bold),
        ),
        Text(user.name,
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 10.0,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}

class _TopicTitleRow extends StatelessWidget {
  final String title;

  _TopicTitleRow({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Text(title, overflow: TextOverflow.ellipsis)],
    );
  }
}

class _TopicBottomRow extends StatelessWidget {
  final int answersCount;
  final bool isVoting;
  final String forum;

  _TopicBottomRow({this.answersCount, this.isVoting, this.forum});

  Widget votePic() {
    return isVoting ? Icon(Icons.assessment) : Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(forum),
            Icon(
              Icons.chat,
              size: 20.0,
            ),
            Text(
              answersCount.toString(),
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
        votePic()
      ],
    );
  }
}
