
import 'package:get/get.dart';

import '../screens/screens.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(name: AppRoutes.setting, page: () => const SettingScreen()),
    GetPage(name: AppRoutes.settingLanguage, page: () => const SettingLanguageScreen()),

  ];
}
