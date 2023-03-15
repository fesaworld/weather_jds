import '../model/city_model.dart';
import '../model/prov_model.dart';

abstract class Repository {

  Future<ProvModel?> provGet();
  Future<CityModel?> cityGet(String idProv);
}