import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_jds/base/base_controller.dart';
import 'package:weather_jds/screen/mainscreen/main_screen.dart';


class SplashController extends BaseController {

  @override
  void onInit() {
    super.onInit();

    timerStart();
  }

  void timerStart() async {
    Timer(const Duration(seconds: 3), () async {
      Get.offAll(const MainScreen());
    });
  }

}