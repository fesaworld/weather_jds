import 'package:weather_jds/data/model/prov_model.dart';

import '../../base/base_controller.dart';

class MainController extends BaseController {
  ProvModel? provModel;

  String? selectedProvId;
  String? selectedProv;
  String? selectedCityId;
  String? selectedCity;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}