import 'package:dio/dio.dart';
import '../../../const/app_const.dart';

class NetworkCore {
  final dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
      baseUrl: AppConst.baseUrl,
    );
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}