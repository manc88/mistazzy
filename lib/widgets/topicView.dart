import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/widgets/size.dart';
import 'package:mistazzy/widgets/topicCard.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class TopicView extends StatelessWidget {
  final Topic topic;

  TopicView({this.topic});

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: MarkdownBody(
              styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      letterSpacing: 0.4),
                  a: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      background: new Paint()..color = Colors.blueGrey)),
              //TODO URL LAUNCHER
              onTapLink: (item) => _launchInBrowser(item),
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
