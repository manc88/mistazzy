import 'package:mistazzy/models/topic.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dart:async';
import 'dart:math';

class TopicListModel extends Model {
  List<Topic> _topicList = [];
  List<Topic> get topic {
    return List.of(_topicList);
  }

  bool isPerformingRequest = false;
  int _lastTopicTime;

  Future<void> load({bool refresh = false}) async {
    isPerformingRequest = true;

    if (refresh) {
      _lastTopicTime = null;
      _topicList.clear();
    }

    var res = await Topic.getList(utime: _lastTopicTime);
    _topicList.addAll(res);
    _lastTopicTime =
        (_topicList.map((f) => f.updated.millisecondsSinceEpoch).reduce(min) ~/
            1000);

    isPerformingRequest = false;
  }
}
