import 'package:capstone_frontend/bloc/regional/regional_bloc.dart';
import 'package:capstone_frontend/core/di/service_locator.dart';
import 'package:capstone_frontend/presentation/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<RegionalBloc>(),
        child: SignupScreen(),
      ),
    );
  }
}
