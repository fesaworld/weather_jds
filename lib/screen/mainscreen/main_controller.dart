import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_jds/data/model/city_model.dart';
import 'package:weather_jds/data/model/prov_model.dart';

import '../../base/base_controller.dart';
import '../../widget/dialog/exception_dialog_widget.dart';
import '../../widget/dialog/loading_dialog_widget.dart';
import '../weatherscreen/weather_screen.dart';

class MainController extends BaseController {
  ProvModel? provModel;
  CityModel? cityModel;

  String? selectedProvId;
  String? selectedProv;
  String? selectedCityId;
  String? selectedCity;

  late BuildContext context;
  bool isException = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    context = Get.context!;

    getProv();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future getProv() async {
    try {
      var response = await repository.provGet();
      provModel = response;
      update();
      return response;
    } catch (e) {
      print(e);
      print('Data Provinsi gagal diambil');
    }
  }

  Future getCity(String idProv) async {
    try {
      var response = await repository.cityGet(idProv);
      cityModel = response;
      update();
      return response;
    } catch (e) {
      print(e);
      print('Data Kabupaten/kota gagal diambil');
    }
  }

  void exceptionDialog(BuildContext context, String message){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => ExceptionDialogWidget(
          message: message,
          onPressed: () {
            Navigator.pop(context, 'close');

            isException = false;
            update();

          },
        )
    );
  }

  void loadingDialog(BuildContext context){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => const LoadingDialogWidget()
    );
  }

  void submit() async{
    if (selectedCity == null || selectedProv == null){
      String message = 'Pilih provinsi & Kabupaten/Kota';
      exceptionDialog(context, message);
    }else{
      loadingDialog(context);
      print('Provinsi = ${selectedProv}');
      print('Kabupaten/Kota = ${selectedCity}');

      Timer(const Duration(seconds: 3), () async {
        Navigator.pop(context, 'close');

        Get.to(() => const WeatherScreen());
      });
    }

  }

}