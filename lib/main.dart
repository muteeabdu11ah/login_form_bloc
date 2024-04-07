import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_flutter/bloc/auth_bloc.dart';
import 'package:login_form_flutter/login_screen.dart';
import 'package:login_form_flutter/pallate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Pallete.backgroundColor,
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
