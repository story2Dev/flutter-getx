import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';

BottomNavigationBarItem _appBottomBarItem(
    bool isSelected, Icon icon, String label) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.transparent,
    icon: icon,
    label: label,
    tooltip: label,
  );
}

class AppBottomBar extends StatelessWidget {
  AppBottomBar({super.key});

  final appController = Get.find<AppController>();
  @override

  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        iconSize: 28.0,
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurple,
        currentIndex: appController.currentIndex.value,
        onTap: appController.onItemTapped,
        items: [
          _appBottomBarItem(appController.currentIndex.value == 0,
              const Icon(Icons.home_outlined), "Home"),
          _appBottomBarItem(appController.currentIndex.value == 1,
              const Icon(Icons.assessment_outlined), "Menu"),
          _appBottomBarItem(appController.currentIndex.value == 2,
              const Icon(Icons.shopping_cart_outlined), "Cart"),
          _appBottomBarItem(appController.currentIndex.value == 3,
              const Icon(Icons.account_circle_outlined), "Profile"),
        ],
      ),
    );
  }
}
