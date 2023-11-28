
import 'package:enitproject/app/routes/app_pages.dart';
import 'package:get/get.dart';


class TabsController extends GetxController{
  RxInt selectIndex = RxInt(0);

  void onTap(int value, GetDelegate delegate) {  //여기서 인터넷 주소 형식으로 데이터 전송된다.
    switch (value) {
      case 0:
        delegate.toNamed(Routes.HOME);
        break;
      case 1:
        delegate.toNamed(Routes.LOCATIONLIST);
        break;
      // case 2:
      //   delegate.toNamed(Routes.ADDLOCATION);
      //   break;
      default:
    }
  }

  void checkCurrentLocation(GetNavConfig? currentRoute) {

    final currentLocation = currentRoute?.location;
    selectIndex.value = 0;

    if (currentLocation?.startsWith(Routes.LOCATIONLIST) == true) {
      selectIndex.value = 1;
    }
    // else if (currentLocation?.startsWith(Routes.MYPAGE) == true) {
    //   selectIndex.value = 2;
    // }
  }
}