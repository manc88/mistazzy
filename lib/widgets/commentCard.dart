import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mistazzy/models/comment.dart';
import 'package:mistazzy/utils/DT.dart';
import 'package:url_launcher/url_launcher.dart';

class CommentTile extends StatelessWidget {
  final Comment comment;
  final Comment answerOn;

  CommentTile(this.comment, this.answerOn);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        child: Image.network(
          "https://www.forum.mista.ru/users_photo/thumb/${comment.userId}.jpg",
        ),
      ),
      onExpansionChanged: null,
      initiallyExpanded: false,
      title: _Base(comment),
      trailing: answerOn != null
          ? null
          : Container(
              width: 0.0,
            ),
      children: <Widget>[
        answerOn != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${answerOn.user} :",
                    ),
                    Text(answerOn.text)
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}

class _Base extends StatelessWidget {
  final Comment comment;

  _Base(this.comment);

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text('#' + comment.n.toString())],
              ),
              Container(
                width: 4.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text(comment.user)],
              ),
              Expanded(
                child: Container(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[Text(Dt.topicDate(comment.utime))],
              )
            ],
          ),
          Divider(),
          Column(
            children: <Widget>[
              MarkdownBody(
                    styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                            color: Colors.black87,
                            fontSize: 18.0,
                            letterSpacing: 0.4),
                        a: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            background: new Paint()..color = Colors.blueGrey)),
                    onTapLink: (item) => _launchInBrowser(item),
                    data: comment.text,
                  ) ??
                  SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

//new tile
