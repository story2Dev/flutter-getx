import 'package:get/get.dart';

import '../services/language_service.dart';

class AppTranslate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        '${Get.locale}': LanguageService().getTranslationsFromStorage(),
      };
}
