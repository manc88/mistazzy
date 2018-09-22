import 'dart:convert' as converter;

import 'package:mistazzy/models/user.dart';
import 'package:html_unescape/html_unescape.dart';

class Topic {
  String id = "";

// - заголовок
  String title = "";

  // - заголовок
  String text = "";

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

  User user = new User("id", "name");

  Topic.fromPreview(Map<String, dynamic> props) {
    //Map<String, String> props = converter.jsonDecode(jsonString);

    if (props.isEmpty) {
      throw ArgumentError();
    }

    var unescape = new HtmlUnescape();

    this.id = props['id'];
    this.title = unescape.convert(props['text']);
    this.text = unescape.convert(props['text']);
    this.forum = props['forum'];
    this.section = props['sect1'];
    this.created = DateTime.fromMillisecondsSinceEpoch(props['created'] * 1000);
    this.updated = new DateTime.fromMicrosecondsSinceEpoch(props['utime']);
    this.answersCount = int.tryParse(props['answ']) ?? 0;
    this.isVoting = props['is_voting'] == "1";
    this.closed = props['closed'] == "1";
    this.down = props['down'] == "1";
    this.user = new User(null, props['user0']);
  }

  Topic.fromFullJSON(String jsonString);

  @override
  String toString() {
    return "id:" + id + "\n" + "text:" + title;
  }

  static List<Topic> testList() {
    String json =
        """[{"id":"825514","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"\u0418\u0442\u043e\u0433\u0438 \u043f\u043e \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044e \u0441\u0432\u043e\u0439\u0441\u0442\u0432 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0432 \u043e\u0442\u0447\u0435\u0442\u0435","created":1537040286,"utime":1537044881,"user":"skupidom","user0":"skupidom","is_voting":"1","answ":"8"},{"id":"825491","forum":"1c","sect1":"","sect2":"","v8":"0","closed":"0","down":"0","text":"Postgres \u0443\u0436\u0435 \u043c\u043e\u0436\u043d\u043e \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u044c? \u0418\u043b\u0438 \u0435\u0449\u0435 \u0441\u044b\u0440\u0430\u044f?","created":1536936666,"utime":1537042622,"user":"\u0424\u0440\u044d\u043d\u043a\u0438","user0":"\u042e\u0440\u0438\u0439 \u041b\u0430\u0437\u0430\u0440\u0435\u043d\u043a\u043e","is_voting":"1","answ":"87"},{"id":"825515","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"\u0423\u043d\u0438\u0432\u0435\u0440\u0441\u0430\u043b\u044c\u043d\u044b\u0439 \u043e\u0431\u043c\u0435\u043d XML, \u043e\u0442\u043a\u0430\u0437 \u043e\u0442 \u043f\u0435\u0440\u0435\u0434\u0430\u0447\u0438","created":1537041850,"utime":1537041850,"user":null,"user0":"rudnitskij","is_voting":"0","answ":"0"},{"id":"825413","forum":"1c","sect1":"","sect2":"","v8":"0","closed":"0","down":"0","text":"\u0411\u0438\u0442\u0440\u0438\u043a\u0441 \u043e\u0431\u043c\u0435\u043d \u0441 1\u0441.","created":1536841764,"utime":1537041510,"user":"\u042e\u0440\u0438\u0439 \u041b\u0430\u0437\u0430\u0440\u0435\u043d\u043a\u043e","user0":"iceman2112","is_voting":"0","answ":"5"},{"id":"824381","forum":"it","sect1":"IT-\u043d\u043e\u0432\u043e\u0441\u0442\u0438","sect2":"it-news","v8":"0","closed":"0","down":"0","text":"INFOSTART EVENT 2018 Education","created":1535162004,"utime":1537040924,"user":"\u042e\u0440\u0438\u0439 \u041b\u0430\u0437\u0430\u0440\u0435\u043d\u043a\u043e","user0":"Dorzh","is_voting":"1","answ":"111"},{"id":"825513","forum":"1c","sect1":"1\u0421 7.7 \u0438 \u0440\u0430\u043d\u0435\u0435","sect2":"v7","v8":"0","closed":"0","down":"0","text":"\u041f\u0440\u043e\u0431\u0438\u0442\u044c \u0447\u0435\u043a \u0432\u043e\u0437\u0432\u0440\u0430\u0442\u0430 \u0447\u0435\u0440\u0435\u0437 \u0442\u0435\u0441\u0442 \u0434\u0440\u0430\u0439\u0432\u0435\u0440\u0430 \u0428\u0442\u0440\u0438\u0445-\u041c \u0424\u0424\u0414 1.05","created":1537039096,"utime":1537039096,"user":null,"user0":"Turku","is_voting":"0","answ":"0"},{"id":"825498","forum":"life","sect1":"\u041f\u043e\u043b\u0438\u0442\u0438\u043a\u0430","sect2":"politic","v8":"0","closed":"1","down":"0","text":"OFF: \u0413\u0435\u043e\u043f\u043e\u043b\u0438\u0442\u0438\u043a\u0430. \u041f\u043e\u0440\u043e\u0448\u0435\u043d\u043a\u043e \u043e\u0431\u044a\u044f\u0432\u0438\u043b \u043e &quot;\u043f\u043e\u0431\u0435\u0434\u0435 \u043d\u0430\u0434 \u0420\u043e\u0441\u0441\u0438\u0435\u0439&quot; (649)","created":1536977782,"utime":1537038898,"user":"youalex","user0":"rphosts","is_voting":"0","answ":"274"},{"id":"825281","forum":"life","sect1":"\u041f\u0440\u0438\u043c\u0435\u0447\u0430\u0442\u0435\u043b\u044c\u043d\u044b\u0435 \u0441\u043e\u0431\u044b\u0442\u0438\u044f","sect2":"events","v8":"0","closed":"0","down":"0","text":"\u041f\u043e\u0437\u0434\u0440\u0430\u0432\u043b\u044f\u044e \u0432\u0441\u0435\u0445 \u0441 \u043c\u0435\u0436\u0434\u0443\u043d\u0430\u0440\u043e\u0434\u043d\u044b\u043c \u0434\u043d\u0435\u043c \u0442\u0440\u0435\u0437\u0432\u043e\u0441\u0442\u0438","created":1536686765,"utime":1537038820,"user":"Nirvana","user0":"\u0415\u0432\u0440\u0435\u0439\u0447\u0438\u043a","is_voting":"1","answ":"135"},{"id":"825509","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"Atol \u043f\u0435\u0447\u0430\u0442\u0430\u0435\u0442 \u043d\u0443\u043b\u0435\u0432\u043e\u0439 \u0447\u0435\u043a","created":1537013875,"utime":1537038142,"user":"karpik666","user0":"kislitsin","is_voting":"0","answ":"1"},{"id":"825403","forum":"life","sect1":"\u041a\u0430\u043a \u0441\u0442\u0440\u0430\u0448\u043d\u043e \u0436\u0438\u0442\u044c","sect2":"fear","v8":"0","closed":"0","down":"0","text":"\u041b\u043e\u0445\u043e\u0442\u0440\u043e\u043d? \u0422\u0435\u043b\u0435\u0444\u043e\u043d \u043d\u0430 60% \u0434\u0435\u0448\u0435\u0432\u043b\u0435","created":1536836085,"utime":1537037881,"user":"Tonik992","user0":"Tonik992","is_voting":"0","answ":"49"},{"id":"825512","forum":"it","sect1":"\u0410\u0434\u043c\u0438\u043d","sect2":"admin","v8":"0","closed":"0","down":"0","text":"\u0421\u0435\u0440\u0432\u0435\u0440 \u0432\u0440\u0435\u043c\u0435\u043d\u0438","created":1537028937,"utime":1537036691,"user":"\u0414\u043e\u043a\u0442\u043e\u0440 \u041a\u0442\u043e","user0":"Velman","is_voting":"0","answ":"3"},{"id":"824180","forum":"life","sect1":"\u0417\u041e\u0416","sect2":"health","v8":"0","closed":"0","down":"0","text":"OFF: \u041a\u0430\u0447\u0430\u043b\u043a\u0430 \u0438\u043b\u0438 \u043a\u0430\u043a \u043f\u0435\u0440\u0435\u0441\u0442\u0430\u0442\u044c \u0431\u044b\u0442\u044c \u0436\u0438\u0440\u043d\u044b\u043c \u0434\u0440\u0438\u0449\u043e\u043c","created":1534867125,"utime":1537035378,"user":"\u0412\u043e\u043b\u0448\u0435\u0431\u043d\u0438\u043a","user0":"ssa_ru_kaf","is_voting":"0","answ":"605"},{"id":"824717","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"\u041d\u0430\u0447\u0430\u043b\u0438\u0441\u044c \u043f\u0440\u043e\u0431\u043b\u0435\u043c\u044b \u0441 \u043f\u0440\u043e\u0438\u0437\u0432\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c\u044e \u0441\u0435\u0440\u0432\u0435\u0440\u0430 1\u0421","created":1535700110,"utime":1537034674,"user":"Arh01","user0":"Arh01","is_voting":"0","answ":"73"},{"id":"825500","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0432\u043e\u0441\u043f\u043e\u043c\u0438\u043d\u0430\u043d\u0438\u0439 \u043e\u0431 \u044d\u043c\u0443\u043b\u044f\u0442\u043e\u0440\u0435 \u0438\u0437 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u043e\u0439 \u0431\u0430\u0437\u0435","created":1536996406,"utime":1537034043,"user":"Cyberhawk","user0":"avyub","is_voting":"0","answ":"17"},{"id":"825502","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"1C \u043e\u0442\u043f\u0440\u0430\u0432\u043a\u0430 PUT \u0437\u0430\u043f\u0440\u043e\u0441\u0430 \u0432 \u0444\u043e\u0440\u043c\u0430\u0442\u0435 JSON","created":1536999872,"utime":1537031016,"user":"Fram","user0":"RECEIVER","is_voting":"0","answ":"3"},{"id":"825505","forum":"it","sect1":"\u0423\u0431\u0438\u0439\u0446\u044b 1\u0421","sect2":"1cmustdie","v8":"0","closed":"0","down":"0","text":"\u041d\u0430\u043a\u0440\u044b\u043b\u0430\u0441\u044c \u0431\u0430\u0437\u0430 (((","created":1537003442,"utime":1537030872,"user":"\u0413\u043e\u0441\u0442\u044c \u0438\u0437 \u041c\u0430\u0440\u0438\u0443\u043f\u043e\u043b\u044f","user0":"mariakw","is_voting":"0","answ":"26"},{"id":"825503","forum":"1c","sect1":"","sect2":"","v8":"0","closed":"0","down":"0","text":"\u0417\u0430\u0432\u0438\u0441\u0430\u0435\u0442 \u0437\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u043c\u0435\u0441\u044f\u0446\u0430 \u0432 \u0415\u0420\u041f","created":1537001555,"utime":1537030661,"user":"Alexor","user0":"Nyarlathotep","is_voting":"0","answ":"12"},{"id":"825330","forum":"life","sect1":"IT-\u043d\u043e\u0432\u043e\u0441\u0442\u0438","sect2":"it-news","v8":"0","closed":"0","down":"0","text":"\u041f\u0440\u0435\u0437\u0435\u043d\u0442\u0430\u0446\u0438\u044f Apple 2018. \u041d\u043e\u0432\u044b\u0435 \u0430\u0439\u0444\u043e\u043d\u044b, \u0430\u0439\u043f\u0430\u0434\u044b, \u0447\u0430\u0441\u044b \u0438 \u043c\u0430\u043a\u0431\u0443\u043a.","created":1536746617,"utime":1537029475,"user":"100kg","user0":"Maniac","is_voting":"0","answ":"123"},{"id":"825511","forum":"1c","sect1":"1\u0421 8","sect2":"v8","v8":"0","closed":"0","down":"0","text":"\u041f\u043e\u043c\u043e\u0449\u044c \u0441 \u043a\u043e\u0434\u043e\u043c \u0422\u0430\u0431\u043b\u0438\u0447\u043d\u043e\u0439 \u0447\u0430\u0441\u0442\u0438","created":1537024612,"utime":1537029100,"user":"asisdes","user0":"asisdes","is_voting":"0","answ":"5"},{"id":"825451","forum":"1c","sect1":"","sect2":"","v8":"0","closed":"0","down":"0","text":"\u041b\u0438\u0446\u0435\u043d\u0437\u0438\u044f \u043d\u0430 \u0441\u0435\u0440\u0432\u0435\u0440 \u043f\u0440\u043e\u0433\u0440\u0430\u043c\u043c\u043d\u0430\u044f \u0438\u043b\u0438 \u0430\u043f\u043f\u0430\u0440\u0430\u0442\u043d\u0430\u044f?","created":1536911739,"utime":1537021318,"user":"Feanor","user0":"ermola","is_voting":"0","answ":"51"}]""";

    Iterable i = converter.jsonDecode(json);
    List<Topic> lst = i.map((model) => Topic.fromPreview(model)).toList();
    return lst;
  }
}
