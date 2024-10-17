import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Obx(() => ListView(
            children: [
              const ListTile(
                title: Text("Language"),
                trailing: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  children: [
                    Text('English'),
                    Icon(Icons.arrow_forward_ios, size: 18)
                  ],
                ),
              ),
              SwitchListTile(
                  title: const Text("Dark Theme"),
                  value: appController.themeMode.value,
                  onChanged: (value) {
                    appController.changeTheme(value);
                    Get.changeThemeMode(appController.themeMode.value
                        ? ThemeMode.dark
                        : ThemeMode.light);
                  }),
              const ListTile(
                title: Text("About"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )),
    );
  }
}
