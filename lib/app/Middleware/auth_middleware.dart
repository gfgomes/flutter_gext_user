import 'package:get/get.dart';
import '../services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  // final AuthService authService = Get.find();

  // @override
  // int? get priority => 1;

  // @override
  // Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
  //   if (route.isProtected && !authService.isAuthenticated) {
  //     return GetNavConfig(
  //         '/'); // Redireciona para a página inicial se não autenticado
  //   }
  //   return super.redirectDelegate(route);
  // }
}
