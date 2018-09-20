import 'package:flutter/material.dart';

class TopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic page"),
      ),
      body: Container(),
      bottomNavigationBar: ButtonBar(children: <Widget>[
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Icon(Icons.home)),
        FlatButton(onPressed: null, child: Icon(Icons.chat)),
        FlatButton(onPressed: null, child: Icon(Icons.create))
      ]),
    );
  }
}
