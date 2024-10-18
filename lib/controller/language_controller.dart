import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_controller.dart';

import '../config/app_config.dart';
import '../services/services.dart';
import '../models/models.dart';

class LanguageController extends GetxController {
  static final to = Get.find<LanguageController>();
  static final appController = Get.find<AppController>();

  LanguageService languageService = LanguageService();

  final box = GetStorage();

  final search = TextEditingController();
  final languages = <LanguageModel>[].obs;
  RxList<LanguageModel> filteredLanguages = <LanguageModel>[].obs;
  final loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    search.addListener(() {
      filteredLanguages.value = languages
          .where((language) =>
              language.name.toLowerCase().contains(search.text.toLowerCase()))
          .toList();
    });

    try {
      loading.value = true;
      languages.value = await languageService.getLanguages();
      filteredLanguages.value = languages;
      loading.value = false;
    } catch (e) {
      throw Exception('[LanguageController] onInit error: $e');
    }
  }

  Future<void> changeLanguage(LanguageModel language) async {
    // delay 1 second
    loading.value = true;
    box.write(AppConfig.languageKey, jsonEncode(language.toJson()));
    await Future.delayed(const Duration(seconds: 1));
    var value = await languageService.getTranslations(language.code);
    final newTranslations = <String, Map<String, String>>{};
    newTranslations[language.code] = value;
    Get.clearTranslations();
    Get.addTranslations(newTranslations);
    Get.updateLocale(Locale(language.code));
    appController.currentLanguage.value = language;
    loading.value = false;
    Get.back();
  }
}
