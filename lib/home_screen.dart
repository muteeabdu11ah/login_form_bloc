import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_flutter/bloc/auth_bloc.dart';
import 'package:login_form_flutter/login_screen.dart';
import 'package:login_form_flutter/pallate.dart';
import 'package:login_form_flutter/widgets/gradient_button.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {

          if(state is AuthLoading) {
            return const Center(
            child: CircularProgressIndicator(
              color: Pallete.gradient1,
            ),
          );
          } 
          else if(state is AuthSucess){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.uid),
                GradientButton(onPressed: () {
                  context.read<AuthBloc>().add(AuthLogOutRequested());
                }),
              ],
            ),
          );}
          else return Center();
        },
      ),
    );
  }
}
