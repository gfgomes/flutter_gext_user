import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gext_user/app/routes/app_routes.dart';
import 'package:flutter_gext_user/app/bindings/user_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User Management App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.HOME,
      getPages: AppRoutes.routes,
      initialBinding: UserBinding(),
      defaultTransition: Transition.fade,
      smartManagement: SmartManagement.full,
      routingCallback: (routing) {},
    );
  }
}
