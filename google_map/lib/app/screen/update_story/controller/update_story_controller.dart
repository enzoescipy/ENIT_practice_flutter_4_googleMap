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
  late final StoryListModel targetStory;

  final Map<String, TextEditingController> textFieldControllers = {
    KEY_TITLE: TextEditingController(),
    KEY_LATITUDE: TextEditingController(),
    KEY_LONGITUDE: TextEditingController(),
    KEY_IMAGE: TextEditingController(),
    KEY_ADDRESS_SEARCH: TextEditingController(),
    KEY_SCRIPT: TextEditingController(),
  };

  @override
  void onInit() {
    final arguments = Get.arguments;
    targetStory = LocationService.to.storyList[arguments.index];
    final targetStoryToMap = targetStory.toMap();
    textFieldControllers.forEach((key, value) {
      value.text = targetStoryToMap[key].toString();
    });
    
    super.onInit();
  }


  Future<void> fireBaseUpdate() async {
    EasyLoading.show();

    if (isUpdated == false) {
      EasyLoading.dismiss();
      return;
    }

    int emptyCount = 0;

    final storyListMap = textFieldControllers.map((key, value) {
      if (value.text.isEmpty) {
        emptyCount++;
      }
      return MapEntry(key, value.text);
    });

    log(storyListMap.toString());

    if (emptyCount == 0 && isUpdated) {
      final model = StoryListModel.fromMap(storyListMap);
      model.addressDetail = model.addressSearch;
      model.circleColor = true;
      model.isLike = false;

      await storyListNetworkRepository.updateStoryModel(model);
      
      LocationService.to.storyList.add(model);
    }

    EasyLoading.dismiss();
    super.dispose();
  }
}
