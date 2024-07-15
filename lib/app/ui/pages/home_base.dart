import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gext_user/app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME_JSON);
              },
              child: const Text('Home Json'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME_SQLITE);
              },
              child: const Text('Home SQLite'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.USER_FORM_JSON);
              },
              child: const Text('Form Json'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.USER_FORM_SQLITE);
              },
              child: const Text('Form SQLite'),
            ),
          ],
        ),
      ),
    );
  }
}
