import 'package:capstone_frontend/bloc/regional/regional_event.dart';
import 'package:capstone_frontend/bloc/regional/regional_state.dart';
import 'package:capstone_frontend/usecase/regional_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionalBloc extends Bloc<RegionalEvent, RegionalState> {
  final RegionalUsecase usecase;

  RegionalBloc(this.usecase) : super(RegionalState()) {
    on<FetchProvinces>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final provinces = await usecase.province();
      emit(
        state.copyWith(
          provinces: provinces,
          cities: [],
          districts: [],
          subdistricts: [],
          selectedProvince: '',
          selectedCity: '',
          selectedDistrict: '',
          selectedSubdistrict: '',
          isLoading: false,
        ),
      );
    });

    on<SelectedProvince>((event, emit) {
      emit(state.copyWith(selectedProvince: event.name));
    });

    on<FetchCities>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final cities = await usecase.city(event.provinceId);
      emit(
        state.copyWith(
          cities: cities,
          districts: [],
          subdistricts: [],
          selectedCity: '',
          selectedDistrict: '',
          selectedSubdistrict: '',
          isLoading: false,
        ),
      );
    });

    on<SelectedCity>((event, emit) {
      emit(state.copyWith(selectedCity: event.name));
    });

    on<FetchDistricts>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final districts = await usecase.district(event.cityId);
      emit(
        state.copyWith(
          districts: districts,
          subdistricts: [],
          selectedDistrict: '',
          selectedSubdistrict: '',
          isLoading: false,
        ),
      );
    });

    on<SelectedDistrict>((event, emit) {
      emit(state.copyWith(selectedDistrict: event.name));
    });

    on<FetchSubdistricts>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final subdistricts = await usecase.subdistrict(event.districtId);
      emit(
        state.copyWith(
          subdistricts: subdistricts,
          selectedSubdistrict: '',
          isLoading: false,
        ),
      );
    });

    on<SelectedSubdistrict>((event, emit) {
      emit(state.copyWith(selectedSubdistrict: event.name));
    });
  }
}
