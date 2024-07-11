import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/Middleware/auth_middleware.dart';
import 'package:flutter_gext_user/app/ui/pages/home_page.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/bindings/user_binding.dart';
import 'app/utils/constants.dart';

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
      // onGenerateRoute: (settings) {
      //   if (settings.name == Routes.HOME) {
      //     return GetPageRoute(
      //       page: () => HomePage(),
      //       settings: settings,
      //       binding: UserBinding(),
      //       parameter: {
      //         'isProtected': 'true', // Exemplo de parâmetro de rota inicial
      //       },
      //     );
      //   }
      //   return null;
      // },
    );
  }
}
