import 'package:flutter/material.dart';
import 'package:flutter_application_getx/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AppBar(
          title: const Text("Profile"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Get.toNamed(AppRoutes.setting);
            }, icon:const Icon(Icons.settings))
          ],
        )
      ],
    );
  }
}