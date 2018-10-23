import 'dart:async';
import 'dart:convert' as converter;

import 'package:mistazzy/models/comment.dart';
import 'package:mistazzy/models/user.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:mistazzy/utils/network.dart';
import 'package:mistazzy/utils/urls.dart';

import 'package:html2md/html2md.dart' as html2md;

class Topic implements Comparable {
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

  List<Comment> comments = <Comment>[];

  User user = new User("id", "name");

  Topic({this.id});

  Topic.fromPreview(Map<String, dynamic> props) {
    if (props.isEmpty) {
      throw ArgumentError();
    }

    var unescape = new HtmlUnescape();

    this.id = props['id'].toString();
    this.title = unescape.convert(props['text']);
    this.forum = props['forum'];
    this.section = props['sect1'];
    this.created = DateTime.fromMillisecondsSinceEpoch(props['created'] * 1000);
    this.updated = DateTime.fromMillisecondsSinceEpoch(props['utime'] * 1000);
    this.answersCount = props['answ'] ?? 0;
    this.isVoting = props['is_voting'] == 1;
    this.closed = props['closed'] == 1;
    this.down = props['down'] == 1;
    this.user = new User(null, props['user0']);
  }

  Topic.fromFullJSON(String jsonString);

  Topic.mock() {
    this.id = "123";
    this.title = "Mock ${this.id}";
    this.forum = "mock forum";
    this.section = "mock section";
    this.created = DateTime.fromMicrosecondsSinceEpoch(1539088364 * 1000);
    this.updated = DateTime.fromMicrosecondsSinceEpoch(1539088364 * 1000);
    this.answersCount = 999;
    this.closed = false;
    this.comments = <Comment>[
      Comment(0, "User 123", "text"),
      Comment(0, "User 123", "text")
    ];
    this.isVoting = true;
    this.closed = false;
    this.down = false;
    this.user = new User(null, "Mock user");
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer()
      ..write("\n")
      ..write("id = " + id)
      ..write("\n")
      ..write('title = ' + title)
      ..write("\n")
      ..write('text = ' + text)
      ..write('\n')
      ..write('updated = ' + updated.millisecondsSinceEpoch.toString())
      ..write('\n')
      ..write("------------------------------------");
    return sb.toString();
  }

  static Future<List<Topic>> getList({int utime}) async {
    var uri1 = getTopicsList(topics: 20, utime: utime); //, utime: utime
    var res = await httpGet(uri1);
    if (res == null)
      return <Topic>[
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock(),
        Topic.mock()
      ];
    Iterable i = converter.jsonDecode(res);
    List<Topic> lst = i.map((item) => Topic.fromPreview(item)).toList();
    return lst;
  }

  Future<void> loadFull() async {
    var uri2 = getTopicMessages(this);
    var res2 = await httpGet(uri2);
    Iterable i = converter.jsonDecode(res2);

    for (var item in i) {
      if (item['n'] == "0") {
        String markdown = html2md.convert(item['text']);
        this.text = markdown;
        item['text'] = this.title;
        comments.add(Comment.fromJson(item));
        loaded = true;
      } else {
        Comment com = Comment.fromJson(item);
        com.answeredTo = getAnswered(com);
        comments.add(com);
      }
    }
  }

  Comment getAnswered(Comment c) {
    String textPart =
        c.text.substring(0, c.text.length < 6 ? c.text.length : 6);
    RegExp regExp = new RegExp(
      r"\([0-9]{1,3}\)",
      caseSensitive: false,
      multiLine: false,
    );

    if (regExp.hasMatch(textPart)) {
      String num = regExp
          .firstMatch(textPart)
          .group(0)
          .replaceAll(RegExp(r"\("), "")
          .replaceAll(RegExp(r"\)"), "");
      int i = int.parse(num);
      return i <= comments.length ? comments[i == 0 ? 0 : i] : null;
    } else {
      return null;
    }
  }

  @override
  int get hashCode => int.tryParse(this.id);

  bool operator ==(obj) => obj is Topic && hashCode == obj.hashCode;

  @override
  int compareTo(other) {
    if (!other is Topic) {
      return -1;
    }
    return updated.millisecondsSinceEpoch -
        (other as Topic).updated.millisecondsSinceEpoch;
  }
}
