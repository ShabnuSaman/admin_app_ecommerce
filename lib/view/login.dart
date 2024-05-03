import 'package:bloc_login_add_product/controller/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_login_add_product/utlis/constants.dart';
import 'package:bloc_login_add_product/view/bottom%20nav/bottom_nav.dart';
import 'package:bloc_login_add_product/view/forgot_pass.dart';
import 'package:bloc_login_add_product/view/signup.dart';
import 'package:bloc_login_add_product/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginAuthenticatedSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => BottomNav()));
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                KHeight10,
                TextFormFieldWidget(
                  controller: emailController,
                  hintText: "email",
                  suffixIcon: Icons.mail,
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
                TextFormFieldWidget(
                  controller: passwordController,
                  hintText: "password",
                  suffixIcon: Icons.visibility_off,
                  obscureText: false,
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                KHeight10,
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      loginBloc.add(LoginSuccessfulEvent(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: const Text("Login"),
                ),
                KHeight30,
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => SignUpScreen()));
                    },
                    child: const Text("Sign Up")),
                KHeight10,
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ForgotPassword()));
                    },
                    child: const Text("forgot password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
