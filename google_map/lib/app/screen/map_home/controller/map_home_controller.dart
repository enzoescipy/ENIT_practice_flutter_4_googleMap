import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapHomeController extends GetxController{

  static MapHomeController get to => Get.find();

   Rx<double> initSize = 1.0.obs;

  RxnString allowPermissionStr = RxnString('');


  /// 초기화
  @override
  void onInit() async{
    EasyLoading.show();
    await loadMore();
    EasyLoading.dismiss();
    super.onInit();
  }

  /// 위치 권한 받아오기 전까지 기다렷다가 진행
  loadMore() async{
    await Future.wait([
      checkPermission().then((value) => {
        allowPermissionStr.value = value
      })
    ]);
  }

  /// 구글맵 사용
  void onMapCreated(GoogleMapController controller){  // 처음 한번만 들어온다.
    mapController = controller;
  }

  bool choolCheckDone = false;
  GoogleMapController? mapController;
  final Completer<GoogleMapController> _controller = Completer();

  Future<void> gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
  /// 위치 권한 받아오기
  Future<String> checkPermission() async{    // 처음에 권한 받아오는 과정
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled(); // 위치권한을 받아오려고 하는 것

    if(!isLocationEnabled){
      return '위치 서비스를 황성화 해주세요.';
    }
    LocationPermission checkPermission = await Geolocator.checkPermission();  // 현재 앱이 가지고있는 위치서비스에 관한 권한을 가져오는 것

    if(checkPermission == LocationPermission.denied){
      checkPermission = await Geolocator.requestPermission();

      if(checkPermission == LocationPermission.denied){
        return '위치 권한을 허가해 주세요';
      }
    }

    if(checkPermission == LocationPermission.deniedForever){
      return '앱의 위치 권한을 세팅에서 허가해주세요';
    }

    return '위치 권한이 허가 되었습니다.';
  }
}
