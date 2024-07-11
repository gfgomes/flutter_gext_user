import 'package:flutter_gext_user/app/data/providers/user_api_provider.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => UserApiProvider());
    // Get.putAsync(
    //   () => AuthService().login('username', 'password'),
    // ); // Exemplo de login automático ao iniciar o app
  }
}
