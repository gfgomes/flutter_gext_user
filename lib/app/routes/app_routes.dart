import 'package:get/get.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/user_form_page.dart';

abstract class Routes {
  static const HOME = '/';
  static const USER_FORM = '/user-form';
}

class AppRoutes {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.USER_FORM, page: () => UserFormPage()),
  ];
}
