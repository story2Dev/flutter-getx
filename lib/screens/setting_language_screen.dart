import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../models/language_model.dart';

class SettingLanguageScreen extends StatelessWidget {
  const SettingLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(LanguageController());
    final appCtl = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("language".tr),
      ),
      body: Obx(() => Column(
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  controller: ctl.search,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: 'Search',
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  if (ctl.filteredLanguages.isEmpty && !ctl.loading.value)
                    const Column(
                      children: [
                        Icon(Icons.search, size: 60),
                        Text('No Data'),
                      ],
                    ),
                  if (ctl.loading.value && ctl.filteredLanguages.isEmpty)
                    const Center(child: CircularProgressIndicator()),
                  ...ctl.filteredLanguages
                      .map((e) => ListTile(
                            title: Text(e.nativeName),
                            trailing:
                                appCtl.currentLanguage.value.code == e.code
                                    ? const Icon(Icons.check, size: 18)
                                    : null,
                            onTap: () {
                              Get.showOverlay(
                                asyncFunction: () => ctl.changeLanguage(
                                    LanguageModel(
                                        e.name, e.code, e.nativeName)),
                                loadingWidget: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          ))
                      .toList(),
                ],
              ))
            ],
          )),
    );
  }
}
