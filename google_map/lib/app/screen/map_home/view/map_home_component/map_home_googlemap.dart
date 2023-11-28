import 'package:enitproject/app/screen/map_home/controller/map_home_controller.dart';
import 'package:enitproject/service/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../story/view/location_view.dart';


class CustomGoogleMap extends GetView<MapHomeController> {
  final MapCreatedCallback onMapCreated;
  const CustomGoogleMap({required this.onMapCreated,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = Set();
    Set<Marker> getmarkers() { //markers to place on map
          markers.add(Marker(
            //add first marker
              markerId: MarkerId(LocationService.to.storyList[0].storyPlayListKey ??'123'),
              position: LatLng(LocationService.to.storyList[0].latitude ?? 0.0, LocationService.to.storyList[0].longitude ?? 0.0), //
              infoWindow: InfoWindow( //popup info
                  title: LocationService.to.storyList[0].title,
                  onTap: (){
                      Get.to(() => LocationView(storyIndex: 0,));
                  }// 타이틀만 보여 줄꺼면 잘보이게 꾸미기 필요
              ),

          ));

      return markers;
    }

    final Set<Circle> circles = new Set();
    Set<Circle> getcircles() { //markers to place on map
        circles.add(Circle( //add first marker
          circleId: CircleId(LocationService.to.storyList[0].storyPlayListKey ?? '123'), // 타이틀만 보여 줄꺼면 잘보이게 꾸미기 필요
          center: LatLng(LocationService.to.storyList[0].latitude ?? 0.0, LocationService.to.storyList[0].longitude ?? 0.0),
          radius: 40,
          strokeColor:Colors.green,
          fillColor: Colors.green.withOpacity(0.5),
          strokeWidth: 1,
        ), //Icon for Marker
        );

      return circles;
    }

    final location = Geolocator.getCurrentPosition();
    double lat =  33.49766527106121;
    double lng =  126.53094118653355;
    final LatLng companyLatLng = LatLng(lat, lng);
    final CameraPosition initialPosition = CameraPosition(  //지도 위치 초기화 및 우리가 바라볼 곳
      target: companyLatLng,
      zoom: 15,
    );

    return Positioned(
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: initialPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          circles: getcircles(),
          markers: getmarkers(),
          onMapCreated: onMapCreated,
          onCameraIdle: ()=>{
            controller.initSize.value = 1
          }

      ),
    );
  }
}