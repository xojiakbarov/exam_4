import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../login_screen.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: GestureDetector(
                onTap: () {
                  context
                      .read<AuthBloc>()
                      .add(AuthenticationLogoutRequestedEvent());
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                          (route) => false);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                )),
          ),
        );
      },
    );
  }
}
