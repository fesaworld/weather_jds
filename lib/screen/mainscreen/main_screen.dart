import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_jds/screen/mainscreen//main_controller.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return const Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
            child: Text(
                'Main Screen'
            ),
          ),
        );
      }
    );
  }
}
