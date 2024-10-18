import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_config.dart';
import '../models/language_model.dart';

class LanguageService extends GetConnect {
  final storage = GetStorage();
  final String baseUrl =
      'https://raw.githubusercontent.com/story2Dev/sample-data-source/main';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl; // Set base URL
    super.onInit();
  }

  Future<List<LanguageModel>> getLanguages() async {
    try {
      final req = await get('/language.json');
      if (req.status.hasError) {
        throw Exception('[getLanguages] Failed to get languages');
      }
      final languages = <LanguageModel>[];

      if (req.body.runtimeType == String) {
        final data = jsonDecode(req.body);
        for (final language in data) {
          languages.add(LanguageModel.fromJson(language));
        }
        return languages;
      }

      for (final language in req.body) {
        languages.add(LanguageModel.fromJson(language));
      }
      return languages;
    } catch (e) {
      throw Exception('[getLanguages] Failed to get languages error: $e');
    }
  }

  Future<Map<String, String>> getTranslations(String code) async {
    try {
      var req = await get('/$code.json', headers: {
        'Content-Type': 'application/json',
      });
      if (req.status.hasError) {
        throw Exception('[getTranslations] Failed to get translations');
      }

      final appTranslations = <String, String>{};
      // convert string to map
      if (req.body.runtimeType == String) {
        final data = jsonDecode(req.body);
        data.forEach((key, value) {
          appTranslations[key] =
              value.toString(); // Cast the dynamic value to a string
        });
      } else {
        var data = (req.body);
        data.forEach((key, value) {
          appTranslations[key] =
              value.toString(); // Cast the dynamic value to a string
        });
      }
      // write to storage
      await storage.write(AppConfig.translateKey, jsonEncode(appTranslations));
      return appTranslations;
    } catch (e) {
      throw Exception('[getTranslations] Failed to get translations error: $e');
    }
  }

  Map<String, String> getTranslationsFromStorage() {
    try {
      final getKey = storage.read(AppConfig.translateKey);
      final appTranslations = <String, String>{};
      if (getKey != null) {
        final data = jsonDecode(getKey);
        data.forEach((key, value) {
          appTranslations[key] =
              value.toString(); // Cast the dynamic value to a string
        });
      } else {
        getTranslations(AppConfig.defaultLanguage)
            .then((value) => appTranslations.addAll(value));
      }
      return appTranslations;
    } catch (e) {
      throw Exception(
          '[getTranslationsFromStorage]: Can not get translations from local storage Error: $e.toString()');
    }
  }
}
