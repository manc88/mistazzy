import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/paginator.dart';
import 'package:mistazzy/utils/Strings.dart';
import 'package:mistazzy/widgets/size.dart';
import 'package:mistazzy/widgets/topicView.dart';

class TopicPage extends StatelessWidget {
  final Topic topic;
  TopicPage(this.topic);

  void _bottomBarOnTap(int i, BuildContext cnt) {
    switch (i) {
      case 0:
        Paginator.pop(cnt);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(Strings.appName),
        ),
        body: Container(child: TopicView(topic: topic)),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => _bottomBarOnTap(index, context),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blueGrey,
                  size: BottomBarSize.icon,
                ),
                title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat,
                    color: Colors.blueGrey, size: BottomBarSize.icon),
                title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.create,
                    color: Colors.blueGrey, size: BottomBarSize.icon),
                title: Container())
          ],
        ));
  }
}
