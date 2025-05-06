import 'package:capstone_frontend/data/model/city_model.dart';
import 'package:capstone_frontend/data/model/district_model.dart';
import 'package:capstone_frontend/data/model/province_model.dart';
import 'package:capstone_frontend/data/model/subdistrict_model.dart';

class RegionalState {
  final List<Province> provinces;
  final List<City> cities;
  final List<District> districts;
  final List<Subdistrict> subdistricts;
  final String selectedProvince;
  final String selectedCity;
  final String selectedDistrict;
  final String selectedSubdistrict;
  final bool isLoading;
  final String? errorMessage;

  RegionalState({
    this.provinces = const [],
    this.cities = const [],
    this.districts = const [],
    this.subdistricts = const [],
    this.selectedProvince = '',
    this.selectedCity = '',
    this.selectedDistrict = '',
    this.selectedSubdistrict = '',
    this.isLoading = false,
    this.errorMessage,
  });

  RegionalState copyWith({
    List<Province>? provinces,
    List<City>? cities,
    List<District>? districts,
    List<Subdistrict>? subdistricts,
    String? selectedProvince,
    String? selectedCity,
    String? selectedDistrict,
    String? selectedSubdistrict,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RegionalState(
      provinces: provinces ?? this.provinces,
      cities: cities ?? this.cities,
      districts: districts ?? this.districts,
      subdistricts: subdistricts ?? this.subdistricts,
      selectedProvince: selectedProvince ?? this.selectedProvince,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
      selectedSubdistrict: selectedSubdistrict ?? this.selectedSubdistrict,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
