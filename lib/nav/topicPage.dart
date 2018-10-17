import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/paginator.dart';
import 'package:mistazzy/utils/Strings.dart';
import 'package:mistazzy/widgets/size.dart';
import 'package:mistazzy/widgets/topicView.dart';

class TopicPage extends StatefulWidget {
  final Topic topic;
  TopicPage(this.topic);

  @override
  TopicPageState createState() {
    return new TopicPageState();
  }
}

class TopicPageState extends State<TopicPage> {
  bool loading;

  void loadData() async {
    await widget.topic.loadFull();
    setState(() {
      loading = false;
    });
  }

  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });

    loadData();
  }

  void _bottomBarOnTap(int i, BuildContext cnt) {
    switch (i) {
      case 0:
        Paginator.pop(cnt);
        break;
      case 1:
        Paginator.goToTopicComments(cnt, widget.topic);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget loader = Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blueGrey,
      ),
    );

    Widget body = Container(child: TopicView(topic: widget.topic));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(Strings.appName),
      ),
      body: loading ? loader : body,
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
      ),
    );
  }
}
