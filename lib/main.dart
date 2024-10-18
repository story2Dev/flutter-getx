import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/app_controller.dart';
import 'core/core.dart';
import 'pages/pages.dart';
import 'widgets/widgets.dart';
import 'package:flutter_application_getx/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  Get.put(AppController());
  runApp(EasyOrder());
}

class EasyOrder extends StatelessWidget {
  EasyOrder({super.key});

  final appController = Get.find<AppController>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var dataLang =
        appController.currentLanguage().code.split('_');
    var code = dataLang.isNotEmpty ? dataLang[0] : 'en';
    var country = dataLang.length > 1 ? dataLang[1] : 'US';

    return GetMaterialApp(
      title: 'Easy Order',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: appController.isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(),
      getPages: AppPages.routes,
      translations: AppTranslate(),
      locale: Locale(code, country),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: appController.pageViewControllers.value,
        // onPageChanged: appController.onItemTapped,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          FoodPage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
