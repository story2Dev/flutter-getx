import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {

  static AppController get to => Get.find();

  final box = GetStorage();

  final pageViewControllers = PageController().obs;
  final currentIndex = 0.obs;

  bool get isDark => box.read('app-theme') ?? false;
  final themeMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    themeMode.value = isDark;
  }

  void onItemTapped(int index) {
    currentIndex.value = index;
    pageViewControllers.value.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void changeTheme(bool val) {
    themeMode.value = val;
    box.write('app-theme', val);
  }
}
