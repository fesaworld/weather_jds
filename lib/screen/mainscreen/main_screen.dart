import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_choices/search_choices.dart';
import 'package:weather_jds/const/text_style.dart';
import 'package:weather_jds/screen/mainscreen/main_controller.dart';

import '../../const/color_palette.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Weather APP'),
          ),
          body: SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text('Provinsi', style: subTitle.copyWith(color: ColorPalette.body)),
                          const SizedBox(
                            height: 5,
                          ),
                          SearchChoices.single(
                            items: controller.provModel != null
                                ? controller.provModel!.provinsi!
                                    .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item.nama,
                                          child: Text(
                                              item.nama
                                                  .toString(),
                                              style: subTitle),
                                        ))
                                .toList()
                                : const [],
                            value: controller.selectedProv,
                            hint: "Pilih Provinsi",
                            style: subTitle,
                            onChanged: (value) {
                              for (var data in controller.provModel!.provinsi!) {
                                if (value != null && value == data.nama){
                                  print(data.id.toString());
                                  print(data.nama.toString());

                                  controller.selectedProvId = data.id.toString();
                                  controller.selectedProv = data.nama;

                                  controller.getCity(controller.selectedProvId.toString());

                                }else if (value == null) {
                                  controller.selectedProvId = null;
                                  controller.selectedProv = null;
                                }
                              }
                              controller.update();
                            },
                            dialogBox: false,
                            isExpanded: true,
                            clearIcon: Icon(Icons.close, color: ColorPalette.body),
                            displayClearIcon:
                            controller.selectedProv == null
                                ? false
                                : true,
                            onClear: () {
                              controller.cityModel = null;
                              controller.selectedCityId = null;
                              controller.selectedCity = null;

                              controller.selectedProvId = null;
                              controller.selectedProv = null;
                              controller.update();
                            },
                            menuConstraints: BoxConstraints.tight(
                                const Size.fromHeight(350)),
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 35,
                              color: ColorPalette.body,
                            ),
                            searchInputDecoration:
                            InputDecoration(
                              hintText: 'Cari Provinsi..',
                              hintStyle: subTitle.copyWith(color: ColorPalette.body.withOpacity(0.7)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8)),
                              contentPadding:
                              const EdgeInsets.all(12),
                            ),
                            fieldPresentationFn:
                                (Widget fieldWidget,
                                {bool? selectionIsValid}) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: ColorPalette.body
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(
                                          8)),
                                  child: fieldWidget);
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text('Kabupaten/Kota', style: subTitle.copyWith(color: ColorPalette.body),),
                          const SizedBox(
                            height: 5,
                          ),
                          SearchChoices.single(
                            items: controller.cityModel != null
                                ? controller.cityModel!.kotaKabupaten!
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item.nama,
                                  child: Text(
                                      item.nama
                                          .toString(),
                                      style: subTitle),
                                ))
                                .toList()
                                : const [],
                            value: controller.selectedCity,
                            hint: "Pilih Kabupaten/Kota",
                            style: subTitle,
                            onChanged: (value) {
                              for (var data in controller
                                  .cityModel!.kotaKabupaten!) {
                                if (value != null &&
                                    value == data.nama) {
                                  print(data.id.toString());
                                  print(data.nama.toString());
                                  controller.selectedCityId = data.id.toString();
                                  controller.selectedCity = data.nama;
                                } else if (value == null) {
                                  controller.selectedCityId = null;
                                  controller.selectedCity = null;
                                }
                              }
                              controller.update();
                            },
                            dialogBox: false,
                            isExpanded: true,
                            clearIcon: Icon(Icons.close, color: ColorPalette.body),
                            displayClearIcon:
                            controller.selectedCity == null
                                ? false
                                : true,
                            menuConstraints: BoxConstraints.tight(
                                const Size.fromHeight(350)),
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 35,
                              color: ColorPalette.body
                            ),
                            searchInputDecoration:
                            InputDecoration(
                              hintText: 'Cari Kabupaten..',
                              hintStyle: subTitle.copyWith(color: ColorPalette.body.withOpacity(0.7)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8)),
                              contentPadding:
                              const EdgeInsets.all(12),
                            ),
                            fieldPresentationFn:
                                (Widget fieldWidget,
                                {bool? selectionIsValid}) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: ColorPalette.body
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(
                                          8)),
                                  child: fieldWidget);
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      width: Get.width,
                      height: 75,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.button,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          controller.submit();
                        },
                        child: Text(
                            'Proses',
                            style: title.copyWith(color: ColorPalette.white)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
        );
      }
    );
  }
}
