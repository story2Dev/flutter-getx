import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';
import '../routes/app_pages.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
      ),
      body: Obx(() => ListView(
            children: [
              ListTile(
                title: Text("language".tr),
                trailing:  Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  children: [
                    Text(appController.currentLanguage.value.nativeName),
                    const Icon(Icons.arrow_forward_ios, size: 18)
                  ],
                ),
                onTap: () => Get.toNamed(AppRoutes.settingLanguage),
              ),
              SwitchListTile(
                  title: Text("dark_theme".tr),
                  value: appController.themeMode.value,
                  onChanged: (value) {
                    appController.changeTheme(value);
                    Get.changeThemeMode(appController.themeMode.value
                        ? ThemeMode.dark
                        : ThemeMode.light);
                  }),
               ListTile(
                title: Text("about".tr),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          )),
    );
  }
}
