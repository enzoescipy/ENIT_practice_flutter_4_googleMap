import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:enitproject/repository/storylist_network_repository.dart';
import 'package:enitproject/model/storylist_model.dart';

import 'package:enitproject/const/const.dart';

import 'package:enitproject/service/location_service.dart';

class UpdateStoryController extends GetxController {
  static UpdateStoryController get to => Get.find();
  bool isUpdated = false;
  late final Map<String, dynamic> storyMap;
  final arguments = Get.arguments;

  final Map<String, TextEditingController> textFieldControllers = {
    KEY_TITLE: TextEditingController(),
    KEY_LATITUDE: TextEditingController(),
    KEY_LONGITUDE: TextEditingController(),
    KEY_IMAGE: TextEditingController(),
    KEY_ADDRESS_SEARCH: TextEditingController(),
    KEY_SCRIPT: TextEditingController(),
  };

  Future<void> fireBaseUpdate() async {
    EasyLoading.show();

    if (isUpdated == false) {
      EasyLoading.dismiss();
      return;
    }

    int emptyCount = 0;

    final storyFieldMap = textFieldControllers.map((key, value) {
      if (value.text.isEmpty) {
        emptyCount++;
      }
      return MapEntry(key, value.text);
    });

    storyFieldMap.forEach((key, value) {
      storyMap[key] = value;
    });

    log(storyMap.toString());

    if (emptyCount == 0 && isUpdated) {
      final model = StoryListModel.fromMap(storyMap);
      model.addressDetail = model.addressSearch;
      model.circleColor = true;
      model.isLike = false;

      await storyListNetworkRepository.updateStoryModel(model);

      final storyList = LocationService.to.storyList;
      final currentStoryIndex = storyList.indexWhere((element) => element.pkey == model.pkey);
      storyList[currentStoryIndex] = model;
    }

    EasyLoading.dismiss();
    super.dispose();
  }
}
