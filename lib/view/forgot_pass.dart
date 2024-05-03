import 'package:bloc_login_add_product/controller/bloc/forgot/bloc/forgot_bloc.dart';
import 'package:bloc_login_add_product/utlis/constants.dart';
import 'package:bloc_login_add_product/view/login.dart';
import 'package:bloc_login_add_product/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final forgotBloc = BlocProvider.of<ForgotBloc>(context); 
    return BlocListener<ForgotBloc, ForgotState>(
      listener: (context, state) {
        if (state is ForgotPasswordAuthenticatedState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>LoginScreen() ));
        }
      },
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                controller: emailController,
                hintText: "email",
                suffixIcon: Icons.email,
                obscureText: false,
                validator: (value) {
                  const pattern =
                      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                  final regex = RegExp(pattern);
          
                  return value!.isEmpty || !regex.hasMatch(value)
                      ? 'Enter a valid email address'
                      : null;
                },
              ),
              KHeight10,
              ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      forgotBloc.add(ForgotPasswordSuccessfulEvent(email: emailController.text.toString()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: const Text("Reset Password"))
            ],
          ),
        ),
      ),
    );
  }
}
