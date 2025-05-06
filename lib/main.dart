import 'package:capstone_frontend/bloc/regional/regional_bloc.dart';
import 'package:capstone_frontend/bloc/signup/signup_bloc.dart';
import 'package:capstone_frontend/bloc/signup/signup_state.dart';
import 'package:capstone_frontend/bloc/verify_signup/verify_signup_bloc.dart';
import 'package:capstone_frontend/core/di/service_locator.dart';
import 'package:capstone_frontend/presentation/screens/auth_screen.dart';
import 'package:capstone_frontend/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SignupBloc>(create: (_) => sl<SignupBloc>()),
          BlocProvider<RegionalBloc>(create: (_) => sl<RegionalBloc>()),
        ],
        child: SignupScreen(listener: singupListener),
      ),
    );
  }
}

void Function(BuildContext, SignupState) singupListener = (context, state) {
  if (state is SignupSuccess) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.message)));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (context) => sl<VerifySignupBloc>(),
              child: OtpScreen(email: state.email),
            ),
      ),
    );
  } else if (state is SignupFailure) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.error)));
  }
};
