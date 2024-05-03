import 'package:bloc_login_add_product/controller/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_login_add_product/controller/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_login_add_product/view/login.dart';
import 'package:bloc_login_add_product/view/widgets/view_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<HomeBloc, HomeState>(
    //   builder: (context, state) {
        return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                final logoutBloc = BlocProvider.of<LoginBloc>(context);
                logoutBloc.add(LogoutEvent());
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => LoginScreen()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(
        child: ViewProduct(),
      ),
    );
    //   },
    // );
  }
}
