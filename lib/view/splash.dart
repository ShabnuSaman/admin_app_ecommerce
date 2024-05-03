import 'package:bloc_login_add_product/controller/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_login_add_product/view/bottom%20nav/bottom_nav.dart';
import 'package:bloc_login_add_product/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginAuthenticatedSuccessState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>BottomNav() ));
        } else if(state is LoginUnAuthenticatedState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>LoginScreen() ));
        }
      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified_outlined,
                size: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Verify your Data",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
