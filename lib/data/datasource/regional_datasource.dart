import 'package:capstone_frontend/core/network/regional_client.dart';
import 'package:capstone_frontend/data/model/city_model.dart';
import 'package:capstone_frontend/data/model/district_model.dart';
import 'package:capstone_frontend/data/model/province_model.dart';
import 'package:capstone_frontend/data/model/subdistrict_model.dart';
import 'package:dio/dio.dart';

abstract class RegionalDatasource {
  Future<ProvinceResponse?> province();
  Future<CityResponse?> city(String provinceId);
  Future<DistrictResponse?> district(String cityId);
  Future<SubdistrictResponse?> subdistrict(String districtId);
}

class GoapiRegionalDatasource implements RegionalDatasource {
  final RegionalClient client;

  GoapiRegionalDatasource(this.client);

  @override
  Future<ProvinceResponse?> province() async {
    try {
      final response = await client.get('/regional/provinsi');
      return ProvinceResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<CityResponse?> city(String provinceId) async {
    try {
      final response = await client.get(
        '/regional/kota',
        queryParameters: {'provinsi_id': provinceId},
      );
      return CityResponse.fromJson(response.data);
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<DistrictResponse?> district(String cityId) async {
    try {
      final response = await client.get(
        '/regional/kecamatan',
        queryParameters: {'kota_id': cityId},
      );
      return DistrictResponse.fromJson(response.data);
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<SubdistrictResponse?> subdistrict(String districtId) async {
    try {
      final response = await client.get(
        '/regional/kelurahan',
        queryParameters: {'kecamatan_id': districtId},
      );
      return SubdistrictResponse.fromJson(response.data);
    } on DioException catch (_) {
      return null;
    }
  }
}
