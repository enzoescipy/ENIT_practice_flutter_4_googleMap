import 'dart:async';
import 'package:async/async.dart';
import 'package:get/get.dart';

class SplashService extends GetxService {
  static SplashService get to => Get.find();

  // 특정위젯의 rebuild를 피하게 해주는 기능 AsyncMemoizer
  final memo = AsyncMemoizer<void>();
  Future<void> init() {
    // runOnce 안에 rebuild가 되지 않아야 하는 함수를 넣는다.
    return memo.runOnce(_initFunction);
  }

  // rebuild가 되지 않아야 하는 함수 작성
  Future<void> _initFunction() async {
  }
}
