import 'dart:async';
import 'dart:convert' as converter;

import 'package:mistazzy/models/user.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:mistazzy/utils/network.dart';
import 'package:mistazzy/utils/urls.dart';

import 'package:html2md/html2md.dart' as html2md;

class Topic {
  String id = "";

// - заголовок
  String title = "null";

  // - заголовок
  String text = "null";

// - одно из {'1c','it','life','moder'}
  String forum = "";

// - секция ветки
  String section = "";

// - дата/время создания ветки unix time stamp
  DateTime created;

//- дата/время обновления ветки
  DateTime updated;

//- ник обновившего ветки
  String updatedName = "";

//- количество ответов
  int answersCount;

//- 1 если ветка утоплена
  bool down;

//- 1 если ветка закрыта
  bool closed;

// -1 если ветка удалена
  bool deleted;

//- 1 если голосование
  bool isVoting;

//- загружена полностью
  bool loaded;

  User user = new User("id", "name");

  Topic({this.id});

  Topic.fromPreview(Map<String, dynamic> props) {
    if (props.isEmpty) {
      throw ArgumentError();
    }

    var unescape = new HtmlUnescape();

    this.id = props['id'];
    this.title = unescape.convert(props['text']);
    //this.text = unescape.convert(props['text']);
    this.forum = props['forum'];
    this.section = props['sect1'];
    this.created = DateTime.fromMillisecondsSinceEpoch(props['created'] * 1000);
    this.updated = DateTime.fromMillisecondsSinceEpoch(props['utime'] * 1000);
    this.answersCount = int.tryParse(props['answ']) ?? 0;
    this.isVoting = props['is_voting'] == "1";
    this.closed = props['closed'] == "1";
    this.down = props['down'] == "1";
    this.user = new User(null, props['user0']);
  }

  Topic.fromFullJSON(String jsonString);

  @override
  String toString() {
    StringBuffer sb = StringBuffer()
      ..write("id = " + id)
      ..write("\n")
      ..write('title = ' + title)
      ..write("\n")
      ..write('text = ' + text)
      ..write('\n')
      ..write("------------------------------------");
    return sb.toString();
  }

  static Future<List<Topic>> getList() async {
    var uri1 = getTopicsList(topics: 10);
    var res = await httpGet(uri1);
    Iterable i = converter.jsonDecode(res);
    List<Topic> lst = i.map((item) => Topic.fromPreview(item)).toList();
    return lst;
  }

  Future<void> loadFull() async {
    var uri2 = getTopicMessages(this);
    var res2 = await httpGet(uri2);
    Iterable i = converter.jsonDecode(res2);

    // var unescape = new HtmlUnescape();

    for (var item in i) {
      if (item['n'] == "0") {
        // this.text = unescape.convert(item['text']);
        String markdown = html2md.convert(item['text']);
        this.text = markdown;
        //print(this.text);
        loaded = true;
        break;
      } else {
        //print(item);
      }
    }
  }
}
