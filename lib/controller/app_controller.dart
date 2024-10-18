import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_config.dart';
import '../models/language_model.dart';

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

    final lang = box.read(AppConfig.languageKey);

    if (lang != null) {
      if (lang.runtimeType == String) {
        var data = jsonDecode(lang);
        final language = LanguageModel.fromJson(data);
        currentLanguage.value = language;        
      }
      
      if (lang.runtimeType == Map) {
        final language = LanguageModel.fromJson(lang);
        currentLanguage.value = language;
      }

    }
  }

  final currentLanguage = Rx<LanguageModel>(
    LanguageModel(
      'English',
      'en_US',
      'English',
    ),
  );

  final language = LanguageModel(
    'English',
    'en_US',
    'English',
  ).obs;

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
