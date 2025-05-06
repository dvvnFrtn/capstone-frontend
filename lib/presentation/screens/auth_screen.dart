import 'package:capstone_frontend/bloc/regional/regional_bloc.dart';
import 'package:capstone_frontend/bloc/regional/regional_event.dart';
import 'package:capstone_frontend/bloc/regional/regional_state.dart';
import 'package:capstone_frontend/data/model/city_model.dart';
import 'package:capstone_frontend/data/model/district_model.dart';
import 'package:capstone_frontend/data/model/province_model.dart';
import 'package:capstone_frontend/data/model/subdistrict_model.dart';
import 'package:capstone_frontend/data/validator.dart';
import 'package:capstone_frontend/presentation/components/button_component.dart';
import 'package:capstone_frontend/presentation/components/dropdown_component.dart';
import 'package:capstone_frontend/presentation/components/textfield_component.dart';
import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              backgroundColor: Colors.transparent,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Stack(
                  children: [HeaderBackground(), SignupScreenHeaderText()],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.symmetric(horizontal: 64.0),
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: XColors.secondary,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: false,
                    labelStyle: GoogleFonts.inter(
                      color: XColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: GoogleFonts.inter(
                      color: XColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: XColors.yellow100,
                    ),
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    tabs: [Tab(text: 'Daftar'), Tab(text: 'Masuk')],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(top: 32.0),
          child: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: SignupForm(),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: SigninForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emController = TextEditingController();
  final _pwController = TextEditingController();
  final _cwController = TextEditingController();
  final _fnController = TextEditingController();
  final _rtController = TextEditingController();
  final _rwController = TextEditingController();
  final _sdController = TextEditingController();
  final _dsController = TextEditingController();
  final _ctController = TextEditingController();
  final _prController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RegionalBloc>().add(FetchProvinces());
  }

  @override
  void dispose() {
    _emController.dispose();
    _pwController.dispose();
    _cwController.dispose();
    _fnController.dispose();
    _rtController.dispose();
    _rwController.dispose();
    _dsController.dispose();
    _sdController.dispose();
    _ctController.dispose();
    _prController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16.0,
        children: [
          XTextField(
            controller: _fnController,
            label: 'Nama lengkap',
            validator: fullnameValidator,
          ),
          XTextField(
            controller: _emController,
            label: 'Email',
            validator: emailValidator,
          ),
          XTextField(controller: _fnController, label: 'Nama Lengkap'),
          XTextField(
            controller: _pwController,
            label: 'Password',
            obsecure: true,
            validator: passwordValidator,
          ),
          XTextField(
            controller: _cwController,
            label: 'Konfirmasi Password',
            obsecure: true,
            validator:
                (value) => confirmPasswordValidator(value, _pwController.text),
          ),
          BlocSelector<RegionalBloc, RegionalState, List<Province>>(
            selector: (state) => state.provinces,
            builder: (context, provinces) {
              return XDropDown(
                controller: _prController,
                label: 'Provinsi',
                entries:
                    provinces
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList(),
                onSelected: (province) {
                  context.read<RegionalBloc>().add(
                    SelectedProvince(province!.name),
                  );
                  context.read<RegionalBloc>().add(FetchCities(province.id));
                },
              );
            },
          ),
          BlocSelector<RegionalBloc, RegionalState, List<City>>(
            selector: (state) => state.cities,
            builder: (context, cities) {
              return XDropDown(
                controller: _ctController,
                label: 'Kota/Kabupaten',
                entries:
                    cities
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList(),
                onSelected: (city) {
                  context.read<RegionalBloc>().add(SelectedDistrict(city!.id));
                  context.read<RegionalBloc>().add(FetchDistricts(city.id));
                },
              );
            },
          ),
          BlocSelector<RegionalBloc, RegionalState, List<District>>(
            selector: (state) => state.districts,
            builder: (context, districts) {
              return XDropDown(
                controller: _dsController,
                label: 'Kecamatan',
                entries:
                    districts
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList(),
                onSelected: (district) {
                  context.read<RegionalBloc>().add(
                    SelectedDistrict(district!.name),
                  );
                  context.read<RegionalBloc>().add(
                    FetchSubdistricts(district.id),
                  );
                },
              );
            },
          ),
          BlocSelector<RegionalBloc, RegionalState, List<Subdistrict>>(
            selector: (state) => state.subdistricts,
            builder: (context, subdistricts) {
              return XDropDown(
                controller: _sdController,
                label: 'Kelurahan',
                entries:
                    subdistricts
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList(),
                onSelected: (subdistrict) {
                  context.read<RegionalBloc>().add(
                    SelectedSubdistrict(subdistrict!.name),
                  );
                },
              );
            },
          ),
          XTextField(
            controller: _rtController,
            label: 'RT',
            keyboardType: TextInputType.number,
            validator: (value) => requiredField(value, name: 'RT'),
          ),
          XTextField(
            controller: _rwController,
            label: 'RW',
            keyboardType: TextInputType.number,
            validator: (value) => requiredField(value, name: 'RW'),
          ),
          XButton(
            label: 'Daftar',
            onPressed: () {
              _formKey.currentState!.validate();
            },
          ),
        ],
      ),
    );
  }
}

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  final _emController = TextEditingController();
  final _pwController = TextEditingController();

  @override
  void dispose() {
    _emController.dispose();
    _pwController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16.0,
        children: [
          XTextField(
            controller: _emController,
            label: 'Email',
            validator: emailValidator,
          ),
          XTextField(
            controller: _pwController,
            label: 'Password',
            obsecure: true,
            validator: passwordValidator,
          ),
          XButton(
            label: 'Masuk',
            onPressed: () {
              _formKey.currentState!.validate();
            },
          ),
        ],
      ),
    );
  }
}

class SignupScreenHeaderText extends StatelessWidget {
  const SignupScreenHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.0,
        children: [
          Text(
            'Selamat Datang',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: XColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
          Text(
            'Hanya admin yang dapat melakukan pendaftaran',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(color: XColors.black),
          ),
        ],
      ),
    );
  }
}

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [XColors.primary, XColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          top: 180,
          left: -80,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(40),
            ),
          ),
        ),
        Positioned(
          top: 100,
          right: -60,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(40),
            ),
          ),
        ),
      ],
    );
  }
}
