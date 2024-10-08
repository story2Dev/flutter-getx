import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/app_controller.dart';
import 'pages/pages.dart';
import 'widgets/widgets.dart';
import 'package:flutter_application_getx/routes/app_pages.dart';


void main() {
  Get.put(AppController());
  runApp(const EasyOrder());
}

class EasyOrder extends StatelessWidget {
  const EasyOrder({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Easy Order',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        getPages: AppPages.routes);
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
        // onPageChanged: (value) => appController.onItemTapped(value),
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
