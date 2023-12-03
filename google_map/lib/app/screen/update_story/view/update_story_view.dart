import 'package:enitproject/app/screen/update_story/controller/update_story_controller.dart';
import 'package:enitproject/service/location_service.dart';
import 'package:enitproject/model/storylist_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:enitproject/const/const.dart';
import 'dart:developer';

class UpdateStoryView extends GetView<UpdateStoryController> {
  final int storyIndex;
  late final Map<String, dynamic> storyMap;
  UpdateStoryView({required this.storyIndex, Key? key}) : super(key: key) {
    storyMap = LocationService.to.storyList[storyIndex].toMap();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              '마커 수정',
              style: TextStyle(color: Colors.black),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                iconSize: 35.0,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          body: Center(
            child: Container(
              child: SizedBox(
                width: 300,
                child: ListView(
                  children: [
                    ListViewNameField(),
                    ListViewLatitudeField(),
                    ListViewLongitudeField(),
                    ListViewImageField(),
                    ListViewAddressField(),
                    ListViewScriptField(),
                    Submit()
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget ListViewNameField() {
    log("11");
    final textFieldControl = controller.textFieldControllers[KEY_TITLE];
    textFieldControl?.text = storyMap[KEY_TITLE].toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(
              "이름",
              textAlign: TextAlign.center,
            )),
        Expanded(child: TextField(controller: controller.textFieldControllers[KEY_TITLE]))
      ],
    );
  }

  Widget ListViewLatitudeField() {
    log("12");
    final textFieldControl = controller.textFieldControllers[KEY_LATITUDE];
    textFieldControl?.text = storyMap[KEY_LATITUDE].toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(
              "위도",
              textAlign: TextAlign.center,
            )),
        Expanded(child: TextField(controller: controller.textFieldControllers[KEY_LATITUDE]))
      ],
    );
  }

  Widget ListViewLongitudeField() {
    log("13");
    final textFieldControl = controller.textFieldControllers[KEY_LONGITUDE];
    textFieldControl?.text = storyMap[KEY_LONGITUDE].toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(
              "경도",
              textAlign: TextAlign.center,
            )),
        Expanded(child: TextField(controller: controller.textFieldControllers[KEY_LONGITUDE]))
      ],
    );
  }

  Widget ListViewImageField() {
    log("14");
    final textFieldControl = controller.textFieldControllers[KEY_IMAGE];
    textFieldControl?.text = storyMap[KEY_IMAGE].toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(
              "이미지 URL",
              textAlign: TextAlign.center,
            )),
        Expanded(child: TextField(controller: controller.textFieldControllers[KEY_IMAGE]))
      ],
    );
  }

  Widget ListViewAddressField() {
    log("15");
    final textFieldControl = controller.textFieldControllers[KEY_ADDRESS_SEARCH];
    textFieldControl?.text = storyMap[KEY_ADDRESS_SEARCH].toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(
              "주소",
              textAlign: TextAlign.center,
            )),
        Expanded(child: TextField(controller: controller.textFieldControllers[KEY_ADDRESS_SEARCH]))
      ],
    );
  }

  Widget ListViewScriptField() {
    log("16");
    final textFieldControl = controller.textFieldControllers[KEY_SCRIPT];
    textFieldControl?.text = storyMap[KEY_SCRIPT].toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(
              "장소 설명",
              textAlign: TextAlign.center,
            )),
        Expanded(child: TextField(controller: controller.textFieldControllers[KEY_SCRIPT]))
      ],
    );
  }

  Widget Submit() {
    return Center(
      child: IconButton(
        icon: Icon(Icons.send),
        onPressed: (() async {
          controller.isUpdated = true;
          controller.storyMap = storyMap;
          await controller.fireBaseUpdate();
          Get.back();
        }),
      ),
    );
  }
}
