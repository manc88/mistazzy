import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mistazzy/models/comment.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/utils/DT.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCommentTile extends StatefulWidget {
  final Comment comment;
  //todo scoped models
  final Topic topic;

  MyCommentTile(this.comment, this.topic);

  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<MyCommentTile> {
  bool _showAnsweredOn = false;
  Comment _currentAnswer;

  void _setShowAnswer({Comment comment}) {
    setState(() {
      if (_currentAnswer != null &&
          comment != null &&
          _currentAnswer.n != comment.n) {
        _showAnsweredOn = true;
      } else {
        _showAnsweredOn = !_showAnsweredOn;
      }

      _currentAnswer = comment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FractionColumnWidth(.1),
                1: FractionColumnWidth(.8),
                2: FractionColumnWidth(.1)
              },
              //border: TableBorder.all(),
              children: [
                TableRow(children: [
                  _buildUserAvatar(),
                  _buildUserName(),
                  _buildCommentNumber()
                ]),
                TableRow(children: [
                  Container(),
                  _buildAnswerOnText(context, 1),
                  Container()
                ]),
                TableRow(children: [
                  Container(),
                  _buildCommentText(),
                  _buildReplyButton()
                ]),
              ],
            ),
            Divider(
              //height: 10.0,
              color: Colors.grey,
              indent: 5.0,
            ),
          ],
        ));
  }

  Widget _buildAnswerOnText(BuildContext cnt, int index) {
    if (!_showAnsweredOn) return Container();

    return GestureDetector(
      onTap: () {
        _setShowAnswer(comment: null);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Container(
          color: Colors.grey,
          child: MarkdownBody(
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                  color: Colors.black, fontSize: 18.0, letterSpacing: 0.4),
            ),
            //onTapLink: (item) => _hadleUserClick(item),
            data: _currentAnswer.text,
          ),
        ),
        // Divider()
      ),
    );
  }

  Future<dynamic> _hadleUserClick(String item) {
    if (item.startsWith('mistazylink')) {
      int index = int.tryParse(item.substring(11));
      _setShowAnswer(
          comment: widget.topic.comments.firstWhere((el) => el.n == index));
    } else {
      _launchInBrowser(item);
    }
  }

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  TableCell _buildUserAvatar() {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Image.network(
        "https://www.forum.mista.ru/users_photo/thumb/${widget.comment.userId}.jpg",
      ),
    );
  }

  TableCell _buildUserName() {
    return TableCell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.comment.user,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey),
            ),
            Text(
              Dt.topicDate(widget.comment.utime),
            )
          ],
        ),
      ),
    );
  }

  TableCell _buildCommentText() {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MarkdownBody(
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
                color: Colors.black87, fontSize: 18.0, letterSpacing: 0.4),
          ),
          onTapLink: (item) => _hadleUserClick(item),
          data: widget.comment.text ?? "null comment text",
        ),
      ),
    );
  }

  TableCell _buildReplyButton() {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.bottom,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.reply,
          color: Colors.blueGrey,
          size: 32.0,
        ),
      ),
    );
  }

  TableCell _buildCommentNumber() {
    return TableCell(
      child: Center(
        //margin: EdgeInsets.all(10.0),
        child: Stack(
          alignment: const Alignment(0.3, -0.3),
          children: <Widget>[
            Icon(
              Icons.bookmark,
              color: Colors.blueGrey,
              size: 48.0,
            ),
            Text(
              widget.comment.n.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
