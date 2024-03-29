import 'package:exam_4/assets/icons.dart';
import 'package:exam_4/core/injector/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../features/authentication/presentation/login_screen.dart';
import '../../features/authentication/presentation/pages/example.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const ExampleScreen()),
                  (_) => false);
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          if(sl<SharedPreferences>().getBool("wizard") == true) {
            Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const LoginScreen()), (_) => false);
          } else {
            Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const OnBoarding()), (_) => false);
          }
          /* Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (_) => false); */
        }
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          context.read<AuthBloc>().add(AuthenticationGetStatusEvent());
        }
        return Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(40),
            child: const CupertinoActivityIndicator(
                radius: 16, color: Color(0xFF8C97AB)),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Center(child: SvgPicture.asset(AppIcons.logo_big)),
            ],
          ),
        );
      },
    );
  }
}
