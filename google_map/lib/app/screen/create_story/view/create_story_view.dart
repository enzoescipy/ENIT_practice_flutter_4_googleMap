import 'package:enitproject/app/screen/create_story/controller/create_story_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:enitproject/const/const.dart';

class CreateStoryView extends GetView<CreateStoryController> {
  const CreateStoryView({Key? key}) : super(key: key);

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
              '마커 생성',
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
          controller.isCreated = true;
          await controller.FireBaseCreate();
          Get.back();
        }),
      ),
    );
  }
}
