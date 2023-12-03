import 'package:enitproject/app/screen/update_story/controller/update_story_controller.dart';
import 'package:get/get.dart';
import 'dart:developer';

class UpdateStroyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UpdateStoryController>(UpdateStoryController());
  }
}
