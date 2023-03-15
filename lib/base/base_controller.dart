import 'package:get/get.dart';

import '../data/model/network/network_core.dart';
import '../data/repository/repository.dart';

abstract class BaseController extends GetxController {
  final networkCore = Get.find<NetworkCore>();
  final repository = Get.find<Repository>();
}