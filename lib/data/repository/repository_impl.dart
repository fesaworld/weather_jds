import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_jds/data/repository/repository.dart';

import '../model/city_model.dart';
import '../model/network/network_core.dart';
import '../model/network/network_weather.dart';
import '../model/prov_model.dart';
import '../model/weather_now_model.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final networkWeather = Get.find<NetworkWeather>();

  final String key = "9b53d369b79c0c5c5f46674e635ffd06";

  @override
  Future<ProvModel?> provGet() async {
    try {
      final response = await network.dio.get('/api/daerahindonesia/provinsi');
      return ProvModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<CityModel?> cityGet(String idProv) async {
    try {
      final response = await network.dio.get('/api/daerahindonesia/kota?id_provinsi=$idProv');
      return CityModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<WeatherNowModel?> weatherNowGet(String city) async {
    try {
      final response = await networkWeather.dio.get('/data/2.5/weather?q=$city&appid=$key');
      return WeatherNowModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}