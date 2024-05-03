import 'package:flutter/material.dart';


ValueNotifier<int>indexChangeNotifier = ValueNotifier(0);
class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context,int newIndex, _) {
      return BottomNavigationBar(
      currentIndex: newIndex,
      onTap: (index) {indexChangeNotifier.value = index ;},
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      items: const[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: "Add"),

    ]);
    });
  }
}
