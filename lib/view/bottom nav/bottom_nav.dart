import 'package:bloc_login_add_product/view/add_product.dart';
import 'package:bloc_login_add_product/view/bottom%20nav/widget/bottom_nav_widget.dart';
import 'package:bloc_login_add_product/view/home.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final pages = [
    const HomePage(),
     AddProduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
