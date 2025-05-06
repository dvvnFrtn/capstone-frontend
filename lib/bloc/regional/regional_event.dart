abstract class RegionalEvent {}

class FetchProvinces extends RegionalEvent {}

class SelectedProvince extends RegionalEvent {
  final String name;
  SelectedProvince(this.name);
}

class FetchCities extends RegionalEvent {
  final String provinceId;
  FetchCities(this.provinceId);
}

class SelectedCity extends RegionalEvent {
  final String name;
  SelectedCity(this.name);
}

class FetchDistricts extends RegionalEvent {
  final String cityId;
  FetchDistricts(this.cityId);
}

class SelectedDistrict extends RegionalEvent {
  final String name;
  SelectedDistrict(this.name);
}

class FetchSubdistricts extends RegionalEvent {
  final String districtId;
  FetchSubdistricts(this.districtId);
}

class SelectedSubdistrict extends RegionalEvent {
  final String name;
  SelectedSubdistrict(this.name);
}
