import 'package:flutter_gext_user/app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_gext_user/app/controllers/user_sqlite_controller.dart';
import 'package:flutter_gext_user/app/data/providers/user_api_provider.dart';
import 'package:flutter_gext_user/app/data/repositories/user_repository.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserJsonController>(() => UserJsonController());
    Get.lazyPut<UserApiProvider>(() => UserApiProvider());
    Get.lazyPut<UserSqliteController>(() => UserSqliteController());
    Get.lazyPut<UserRepository>(() => UserRepository());
  }
}
