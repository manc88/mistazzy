//import 'dart:convert' as converter;

class Topic {
  String id;

// - заголовок
  String text;

// - одно из {'1c','it','life','moder'}
  String forum;

// - секция ветки
  String section;

// - дата/время создания ветки unix time stamp
  DateTime created;

//- user_id автора ветки
  String userId;

//- ник автора ветки
  String userName;

//- дата/время обновления ветки
  DateTime updated;

//- ник обновившего ветки
  String updatedName;

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

//- массив вариантов голосования:
  bool voting;

  Topic.fromPreview(String jsonString);

  Topic.fromFullJSON(String jsonString);
}
