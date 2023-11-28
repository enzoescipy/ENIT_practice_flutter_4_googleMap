import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enitproject/const/const.dart';

import '../const/color.dart';

class StoryListModel {
  String? addressDetail;
  String? addressSearch;
  String? image;
  bool? isLike = false;
  String? mp3Path;
  String? script;
  String? storyPlayListKey;
  String? title;
  double? latitude;
  double? longitude;
  Color changeStoryColor = GREEN_BRIGHT_COLOR;
  bool? circleColor;

  StoryListModel.fromMap(Map<String, dynamic> map)
      : addressDetail = map[KEY_ADDRESS_DETAIL],
        addressSearch = map[KEY_ADDRESS_SEARCH],
        image = map[KEY_IMAGE],
        isLike = map[KEY_LIKE],
        mp3Path = map[KEY_MP3_PATH],
        script = map[KEY_SCRIPT],
        storyPlayListKey = map[KEY_STORY_PLAY_LIST_KEY],
        title = map[KEY_TITLE],
        latitude = map[KEY_LATITUDE].runtimeType == String ? double.parse(map[KEY_LATITUDE]) : map[KEY_LATITUDE].toDouble(),
        longitude = map[KEY_LONGITUDE].runtimeType == String ? double.parse(map[KEY_LONGITUDE]) : map[KEY_LONGITUDE].toDouble(),
        circleColor = map[KEY_CIRCLECOLOR];
  StoryListModel.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data() as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    final resultMap = {
      KEY_ADDRESS_DETAIL: addressDetail,
      KEY_ADDRESS_SEARCH: addressSearch,
      KEY_IMAGE: image,
      KEY_LIKE: isLike,
      KEY_MP3_PATH: mp3Path,
      KEY_SCRIPT: script,
      KEY_STORY_PLAY_LIST_KEY: storyPlayListKey,
      KEY_TITLE: title,
      KEY_LATITUDE: latitude,
      KEY_LONGITUDE: longitude,
      KEY_CIRCLECOLOR: circleColor,
    };

    return resultMap;
  }

  
}
