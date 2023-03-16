import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_jds/const/color_palette.dart';
import 'package:weather_jds/screen/weatherscreen/weather_controller.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(
      init: WeatherController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back, color: ColorPalette.body,),
              onTap: (){
                Get.back();
              },
            ),
          ),
          body: SafeArea(
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Center(
                  child: Text(
                      'Screen 2'
                  ),
                ),
              )
          ),
        );
      }
    );
  }
}
