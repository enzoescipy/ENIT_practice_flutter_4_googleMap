import 'package:enitproject/app/screen/map_home/binding/home_binding.dart';
import 'package:enitproject/app/screen/map_home/view/home_view.dart';
import 'package:enitproject/app/screen/preview/bindings/preview_binding.dart';
import 'package:enitproject/app/screen/preview/view/preview_screen.dart';
import 'package:enitproject/app/screen/root/bindings/root_binding.dart';
import 'package:enitproject/app/screen/root/view/root_screen.dart';

import 'package:enitproject/app/screen/tab/binding/tabs_binding.dart';
import 'package:enitproject/app/screen/tab/view/tabs_screen.dart';
import 'package:get/get.dart';

import 'package:enitproject/app/screen/create_story/view/create_story_view.dart';
import 'package:enitproject/app/screen/create_story/binding/create_story_binding.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          preventDuplicates: true,
          name: _Paths.TAB,
          page: () => const TabsView(),
          bindings: [
            TabsBinding(),
          ],
          title: null,
          children: [
            ///홈
            GetPage(
              name: _Paths.Home,
              page: () => const HomeView(),
              title: 'Home',
              binding: HomeBinding(),
            ),
            /// 이야기 목록
            GetPage(
              name: _Paths.LOCATIONLIST,
              page: () => const PreviewScreen(),
              title: 'Storylist',
              binding: PreviewBinding(),
              // children: [
              //   GetPage(
              //     name: _Paths.CREATE,
              //     page: () => const CreateStoryView(),
              //     title: "StoryCreate",
              //     binding: CreateStroyBinding()
              //   )
              // ]
            ),
          ],
        ),
      ],
    ),
  ];
}
// middlewares: [
//   //only enter this route when authed
//   EnsureAuthMiddleware(),
// ],
