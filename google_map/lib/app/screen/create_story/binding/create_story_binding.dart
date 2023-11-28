import 'package:enitproject/app/screen/create_story/controller/create_story_controller.dart';
import 'package:get/get.dart';

class CreateStroyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateStoryController>(CreateStoryController());
  }
}
