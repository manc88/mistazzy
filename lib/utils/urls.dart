import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/models/user.dart';

const String BASE = "forum.mista.ru";

////////////////////////////////////////////////////////////////////////////////////////////////
////////////// список тем форума
////////////////////////////////////////////////////////////////////////////////////////////////

const String TOPIC_LIST = "/api/topic.php";
// /api/topic.php (/ajax_index.php) - список тем форума
// forum.mista.ru/ajax_index.php?topics=5
// параметры:

// topics - число тем, которые нужно вернуть (по умолчанию - 20);
// utime - время (в формате unixtime) после которого надо вернуть ветки;
// callback - если указано, то ответ заворачивается в вызов функции, имя которой передано в параметре (реализация JSONP);
// forum - раздел форума (1c|it|life);
// section_short_name=politic - отбор по краткому имени секции
// mytopics=1 - отбор только своих тем
// user_id - отбор тем пользователя
// возвращаемое значение:

// массив в формате json. каждый элемент массива соответствует теме форума. порядок элементов в массиве соответствует порядку тем. поля элемента массива:

// id - идентификатор темы, число;
// forum - название раздела форума, строка;
// sect1 - краткое наименование секции (если есть), строка;
// sect2 - код секции (если есть);
// closed - 1, если тема закрыта;
// down - 1, если тема утоплена;
// text - заголовок темы, строка;
// user0 - ник создателя ветки, строка;
// user - ник последнего ответившего, строка;
// utime - время последнего ответа в формате unixtime, число;
// is_voting - 1 если голосование
// answ - число сообщений в ветке.

Uri getTopicsList(
    {int topics = 0,
    int utime,
    String forum,
    String section,
    bool mytopics = false,
    User user}) {
  var params = new Map<String, String>();

  if (topics != 0) {
    params["topics"] = topics.toString();
  }

  if (utime != null) {
    params["beforeutime"] = utime.toString();
  }

  if (forum != null) {
    params["forum"] = forum;
  }

  if (section != null) {
    params["section"] = section;
  }

  if (mytopics) {
    params["mytopics"] = (mytopics ? 1 : 0).toString();
  }

  if (user != null) {
    params["user"] = user.id;
  }

  return new Uri(
      scheme: 'https', host: BASE, path: TOPIC_LIST, queryParameters: params);
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////// информация о ветке
////////////////////////////////////////////////////////////////////////////////////////////////

const String TOPIC_GET = "ajax_gettopic.php";
// /ajax_gettopic.php - информация о ветке
// параметры:

// id - идентификатор (topic_id) темы (!)
// callback - если указано, то ответ заворачивается в вызов функции, имя которой передано в параметре (реализация JSONP).
// возвращаемое значение:

// структура в формате json.

// id - topic_id
// text - заголовок
// forum - одно из {'1c','it','life','moder'}
// section - секция ветки
// created - дата/время создания ветки
// user_id - user_id автора ветки
// user_name - ник автора ветки
// updated - дата/время обновления ветки
// updated_name - ник обновившего ветки
// answers_count - количество ответов
// down - 1 если ветка утоплена
// closed - 1 если ветка закрыта
// deleted - 1 если ветка удалена
// is_voting - 1 если голосование
// voting - массив вариантов голосования:
// * select - вариант ответа
// * result - количество голосов

Uri getTopic(Topic topic) {
  var params = new Map<String, String>();
  params["id"] = topic.id;
  return new Uri(
      scheme: 'https', host: BASE, path: TOPIC_GET, queryParameters: params);
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////// список сообщений темы
////////////////////////////////////////////////////////////////////////////////////////////////

const String TOPIC_MESSAGES = "api/message.php";
// /api/message.php (/ajax_topic.php) - список сообщений темы.
// параметры:

// id - идентификатор (topic_id) темы (!)
// from - с какого сообщения. если не указан, то с первого
// to - до какого сообщения. если не указан, то from+10
// callback - если указано, то ответ заворачивается в вызов функции, имя которой передано в параметре (реализация JSONP).
// возвращаемое значение:

// массив в формате json. каждый элемент массива соответствует сообщению темы форума. порядок элементов в массиве соответствует порядку сообщений. поля элемента массива:

// id - идентификатор сообщения;
// n - номер сообщения;
// text - текст сообщения;
// user - ник пользователя.
// utime - время отправки сообщения в формате unixtime.
// vote - выбранный пункт голосования

Uri getTopicMessages(Topic topic) {
  var params = new Map<String, String>();
  params["id"] = topic.id;
  params["from"] = "0";
  params["to"] = topic.answersCount.toString();

  return new Uri(
      scheme: 'https',
      host: BASE,
      path: TOPIC_MESSAGES,
      queryParameters: params);
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////// Пользователи
////////////////////////////////////////////////////////////////////////////////////////////////

const String LOGIN = "ajax_login.php";
// /ajax_login.php - авторизация пользователя.
// параметры:

// username - логин (ник) пользователя (!);
// password - пароль пользователя (!);
// callback - если указано, то ответ заворачивается в вызов функции, имя которой передано в параметре (реализация JSONP);
// возвращаемое значение:

// хеш-массив (структура) в формате json. поля структуры:

// userid - идентификатор пользователя или 0, число
// error - описание ошибки авторизации или пустая строка

const String USERS = "api/users.php";
// /api/users.php - список пользователей.
// параметры:

// name - логин (ник) пользователя. Поиск по первым символам;
// count - количество значений в выдаче (по-умолчанию 20);
// from - начиная с какого значения (по-умолчанию 0);
// callback - если указано, то ответ заворачивается в вызов функции, имя которой передано в параметре (реализация JSONP);
// возвращаемое значение:

// массив структур в формате json. поля структуры:

// id - идентификатор пользователя, число;
// name - логин (ник) пользователя;
