import 'package:weather_jds/base/base_controller.dart';
import 'package:weather_jds/data/model/weather_now_model.dart';

class WeatherController extends BaseController {

  WeatherNowModel? weatherNowModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cekData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future cekData() async {
    try {
      var response = await repository.weatherNowGet('bogor');
      weatherNowModel = response;
      update();
      return response;
    } catch (e) {
      print(e);
      print('Data gagal diambil');
    }
  }
}