import 'package:enitproject/model/storylist_model.dart';
import 'package:enitproject/repository/storylist_network_repository.dart';
import 'package:get/get.dart';


class LocationService extends GetxService{
  ///싱글톤처럼 쓰기위함
  static LocationService get to => Get.find();

  ///데이터베이스에 있는 정보 가져와서 담을 리스트 선언
  RxList<StoryListModel> storyList = <StoryListModel>[].obs;


  @override
  void onInit() async{
    ///데이터 리스트에 넣어주기
    await storyListNetworkRepository.getStoryListModel().then((value) => {
      storyList(value)
    });

    super.onInit();
  }

}