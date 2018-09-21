import 'package:flutter/material.dart';

import 'package:mistazzy/models/user.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/topicPage.dart';
import 'package:mistazzy/utils/DT.dart';
import 'package:mistazzy/widgets/size.dart';

class Tt extends StatelessWidget {
  final Topic topic;

  Tt(this.topic);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                  'very234353very23435364654676very234353646546746very2343536465467546very23435364654677')
            ],
          )
        ],
      ),
    ));
  }
}

class TopicCard extends StatelessWidget {
  final Topic topic;

  TopicCard(this.topic);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(4.0),
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
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(user.name,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: TopicCardSize.iconText,
                  fontWeight: FontWeight.bold)),
          Text(
            Dt.topicDate(topicTime),
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

class _TopicTitleRow extends StatelessWidget {
  final String title;

  _TopicTitleRow({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext cont) => TopicPage())),
            child: Text(title,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                maxLines: 3,
                style: TextStyle(
                  fontSize: TopicCardSize.titleText,
                  color: Colors.blueGrey,
                ))),
      ],
    );
  }
}

class _TopicBottomRow extends StatelessWidget {
  final int answersCount;
  final bool isVoting;
  final String forum;

  _TopicBottomRow({this.answersCount, this.isVoting, this.forum});

  Widget votePic() {
    return isVoting
        ? Icon(Icons.assessment, size: TopicCardSize.icon, color: Colors.grey)
        : Spacer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      margin: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MessageCount(answersCount: answersCount),
          // Text(
          //   forum,
          //   style: TextStyle(fontSize: 32.0, color: Colors.grey),
          // ),
        ],
      ),
    );
  }
}

class MessageCount extends StatelessWidget {
  const MessageCount({
    Key key,
    @required this.answersCount,
  }) : super(key: key);

  final int answersCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.chat,
          size: TopicCardSize.icon,
          color: Colors.grey,
        ),
        Text(
          answersCount.toString(),
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: TopicCardSize.iconText),
        ),
      ],
    );
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
