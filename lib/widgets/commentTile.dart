import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mistazzy/models/comment.dart';
import 'package:mistazzy/utils/DT.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCommentTile extends StatefulWidget {
  final Comment comment;
  final Comment parentComment;

  MyCommentTile(this.comment, this.parentComment);

  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<MyCommentTile> {
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
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Image.network(
                      "https://www.forum.mista.ru/users_photo/thumb/${widget.comment.userId}.jpg",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.comment.user,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      //margin: EdgeInsets.all(10.0),
                      child: Stack(
                        alignment: const Alignment(0.3, -0.3),
                        children: <Widget>[
                          Icon(
                            Icons.bookmark,
                            color: Colors.grey,
                            size: 48.0,
                          ),
                          Text(
                            widget.comment.n.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  Container(),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: widget.parentComment == null
                          ? Container()
                          : Text(
                              "Ответ на : ${widget.parentComment.user}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                    ),
                  ),
                  Container()
                ]),
                TableRow(children: [
                  Container(),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MarkdownBody(
                        styleSheet: MarkdownStyleSheet(
                            p: TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                                letterSpacing: 0.4),
                            a: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                background: new Paint()
                                  ..color = Colors.blueGrey)),
                        onTapLink: (item) => _launchInBrowser(item),
                        data: widget.comment.text ?? "null comment text",
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                    child: IconButton(
                      tooltip: "repply",
                      onPressed: () {},
                      icon: Icon(
                        Icons.reply,
                        color: Colors.grey,
                        size: 32.0,
                      ),
                    ),
                  )
                ])
              ],
            ),
            Divider(),
          ],
        ));
  }
}
