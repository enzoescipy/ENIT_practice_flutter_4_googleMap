import 'package:enitproject/app/screen/preview/controller/preview_controller.dart';
import 'package:enitproject/service/location_service.dart';
import 'package:enitproject/const/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../story/view/location_view.dart';
import '../../create_story/view/create_story_view.dart';

import 'package:enitproject/app/screen/create_story/binding/create_story_binding.dart';
import 'package:enitproject/app/screen/create_story/controller/create_story_controller.dart';

class PreviewScreen extends GetView<PreviewController> {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          '둘러보기',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          /// 현재위치로 화면 이동
          IconButton(
            onPressed: () async {
              Get.to(
                const CreateStoryView(),
                binding: CreateStroyBinding(),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '전체',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${LocationService.to.storyList.length}',
                  style: const TextStyle(color: FONT_MID_BLACK_COLOR, fontWeight: FontWeight.w500, fontSize: 20.0),
                )
              ],
            ),
            const Divider(
              height: 5,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: LocationService.to.storyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  '${LocationService.to.storyList[index].image}',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${LocationService.to.storyList[index].addressSearch}',
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                        color: GREEN_DARK_COLOR,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${LocationService.to.storyList[index].title}',
                                          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      '${LocationService.to.storyList[index].addressDetail}',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        if (LocationService.to.storyList[index].storyPlayListKey != null) {
                          Get.to(() => LocationView(
                                storyIndex: index,
                              ));
                        }
                      },
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
