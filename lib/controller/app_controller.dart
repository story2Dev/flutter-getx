import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppController extends GetxController {

  static AppController get to => Get.find();

  final pageViewControllers = PageController().obs;
  final currentIndex = 0.obs;

  void onItemTapped(int index) {
    currentIndex.value = index;
    pageViewControllers.value.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }
}
