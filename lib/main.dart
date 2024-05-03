import 'package:bloc_login_add_product/controller/bloc/addProduct/bloc/add_product_bloc.dart';
import 'package:bloc_login_add_product/controller/bloc/forgot/bloc/forgot_bloc.dart';
import 'package:bloc_login_add_product/controller/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_login_add_product/controller/bloc/signup/bloc/signup_bloc.dart';
import 'package:bloc_login_add_product/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc()..add(CheckLoginStatusEvent()),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
         BlocProvider(
          create: (context) => ForgotBloc(),
        ),
         BlocProvider(
          create: (context) => AddProductBloc(),
        ),

      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
