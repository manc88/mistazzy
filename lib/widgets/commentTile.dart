import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mistazzy/models/comment.dart';
import 'package:mistazzy/utils/DT.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCommentTile extends StatefulWidget {
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<MyCommentTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4.0),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: FractionColumnWidth(.12),
            1: FractionColumnWidth(.8),
            2: FractionColumnWidth(.1)
          },
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "User name",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              Icon(Icons.bookmark, color: Colors.black)
            ]),
            TableRow(children: [
              Container(),
              Text("Answered to: Another User Name"),
              Container()
            ]),
            TableRow(children: [
              Container(),
              Text(
                  "If you only have one row, the Row widget is more appropriate. If you only have one column, the SliverList or Column widgets will be more appropriate. "),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.bottom,
                child: Icon(Icons.edit, color: Colors.black),
              )
            ])
          ],
        ));
  }
}
