class Message {
  String id;

//номер
  int n;
//- текст сообщения;
  String text;

// - ник пользователя.
  String user;

//время сообщения
  DateTime utime;

//вариант голосования
  String vote;

  Message.fromJSON(String JSONString) {
    ;
  }
}
