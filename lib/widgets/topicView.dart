import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/widgets/size.dart';
import 'package:mistazzy/widgets/topicCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

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
    print(topic.text);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UpperTopic(topic),
          Divider(),
          TopicTitle(topic),
          //_buildTopicBody(),
          //HtmlView(data: "<p>${topic.rawText}</p>"),
          _buildTopicBody(),
        ],
      ),
    );
  }

  Padding _buildTopicBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Html(
          onLinkTap: (item) => _launchInBrowser(item),
          data: topic.text,
          defaultTextStyle: TextStyle(fontSize: 20.0)),
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
