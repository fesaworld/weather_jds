import 'package:get/get.dart';
import 'package:weather_jds/data/model/network/network_core.dart';
import 'package:weather_jds/data/repository/repository.dart';
import 'package:weather_jds/data/repository/repository_impl.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore(), permanent: true);
    Get.put<Repository>(RepositoryImpl(), permanent: true);
  }
}