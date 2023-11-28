import 'package:enitproject/app/routes/app_pages.dart';
import 'package:enitproject/app/screen/root/controller/root_controller.dart';
import 'package:enitproject/app/screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../service/splash_service.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return FutureBuilder(
            future: SplashService.to.init(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return Scaffold(
                  body: GetRouterOutlet(
                    initialRoute: Routes.TAB
                  ),
                );
              }
              return const SplashScreen();
            });
      },
    );
  }
}
