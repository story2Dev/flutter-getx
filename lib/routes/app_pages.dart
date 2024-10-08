import 'package:get/get.dart';

import '../screens/setting_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(name: AppRoutes.setting, page: () => const SettingScreen()),
  ];
}
