
import 'package:enitproject/service/location_service.dart';
import 'package:enitproject/model/storylist_model.dart';
import 'package:enitproject/repository/storylist_network_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PreviewController extends GetxController{

  //싱글톤처럼 쓰기위함
  static PreviewController get to => Get.find();

  //데이터베이스에 있는 정보 가져와서 담을 리스트 선언
  RxList<StoryListModel> previewStoryList = RxList<StoryListModel>();

  @override
  void onInit() async{
    await storyListNetworkRepository.getStoryListModel().then((value) => {
      previewStoryList(value),
    });
    super.onInit();
  }

}