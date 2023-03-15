import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_jds/data/repository/repository.dart';

import '../model/city_model.dart';
import '../model/network/network_core.dart';
import '../model/prov_model.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

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



}