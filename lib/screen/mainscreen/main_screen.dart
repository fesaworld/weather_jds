import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_choices/search_choices.dart';
import 'package:weather_jds/screen/mainscreen/main_controller.dart';


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
                          Text('Provinsi', style: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w300)),
                          const SizedBox(
                            height: 5,
                          ),
                          SearchChoices.single(
                            items: const [],
                            value: controller.selectedProv,
                            hint: "Pilih Provinsi",
                            style: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w300),
                            onChanged: (value) {},
                            dialogBox: false,
                            isExpanded: true,
                            onClear: () { },
                            menuConstraints: BoxConstraints.tight(
                                const Size.fromHeight(350)),
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 35,
                              color: Colors.grey,
                            ),
                            searchInputDecoration:
                            InputDecoration(
                              hintText: 'Cari Provinsi..',
                              hintStyle: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w300),
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
                                          color: Colors.white30
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
                          Text('Kabupaten/Kota', style: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w300)),
                          const SizedBox(
                            height: 5,
                          ),
                          SearchChoices.single(
                            items: const [],
                            value: controller.selectedCity,
                            hint: "Pilih Kabupaten/Kota",
                            style: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w300),
                            onChanged: (value) { },
                            dialogBox: false,
                            isExpanded: true,
                            menuConstraints: BoxConstraints.tight(
                                const Size.fromHeight(350)),
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 35,
                              color: Colors.grey
                            ),
                            searchInputDecoration:
                            InputDecoration(
                              hintText: 'Cari Kabupaten..',
                              hintStyle: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w300),
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
                                          color: Colors.white30
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
                  ],
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
          bottomSheet: Container(
            padding: EdgeInsets.all(15),
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
                  )),
              onPressed: () {
                print('Provinsi = ');
                print('Kabupaten/Kota = ');

              },
              child: Text(
                  'Proses',
                  style: GoogleFonts.karla(fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          ),
        );
      }
    );
  }
}
