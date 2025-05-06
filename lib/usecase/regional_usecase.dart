import 'package:capstone_frontend/data/datasource/regional_datasource.dart';
import 'package:capstone_frontend/data/model/city_model.dart';
import 'package:capstone_frontend/data/model/district_model.dart';
import 'package:capstone_frontend/data/model/province_model.dart';
import 'package:capstone_frontend/data/model/subdistrict_model.dart';

class RegionalUsecase {
  final RegionalDatasource datasource;

  RegionalUsecase(this.datasource);

  Future<List<Province>> province() async {
    final response = await datasource.province();
    if (response != null) {
      return response.data;
    } else {
      return <Province>[];
    }
  }

  Future<List<City>> city(String provinceId) async {
    final response = await datasource.city(provinceId);
    if (response != null) {
      return response.data;
    } else {
      return <City>[];
    }
  }

  Future<List<District>> district(String cityId) async {
    final response = await datasource.district(cityId);
    if (response != null) {
      return response.data;
    } else {
      return <District>[];
    }
  }

  Future<List<Subdistrict>> subdistrict(String districtId) async {
    final response = await datasource.subdistrict(districtId);
    if (response != null) {
      return response.data;
    } else {
      return <Subdistrict>[];
    }
  }
}
