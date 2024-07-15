import 'package:flutter_gext_user/app/ui/pages/home_base.dart';
import 'package:flutter_gext_user/app/ui/pages/user_sqlite_form_page.dart';
import 'package:get/get.dart';
import 'package:flutter_gext_user/app/ui/pages/home_page_json.dart';
import 'package:flutter_gext_user/app/ui/pages/home_page_sqlite.dart';
import 'package:flutter_gext_user/app/ui/pages/user_form_json_page.dart';
import 'package:flutter_gext_user/app/bindings/user_binding.dart';

abstract class Routes {
  static const HOME = '/';
  static const HOME_JSON = '/home-json';
  static const HOME_SQLITE = '/home-sqlite';
  static const USER_FORM_JSON = '/user-form-json';
  static const USER_FORM_SQLITE = '/user-form-sqlite';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.HOME_JSON,
      page: () => HomePageJson(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.HOME_SQLITE,
      page: () => HomeSqlitePage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.USER_FORM_JSON,
      page: () => UserFormPageJson(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.USER_FORM_SQLITE,
      page: () => UserSqliteForm(),
      binding: UserBinding(),
    ),
  ];
}
