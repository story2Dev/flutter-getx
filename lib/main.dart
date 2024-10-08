import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/app_controller.dart';
import 'pages/pages.dart';
import 'widgets/widgets.dart';

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
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Order'),
      ),
      body: PageView(
        controller: appController.pageViewControllers.value,
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
