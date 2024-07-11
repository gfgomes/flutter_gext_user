import 'package:get/get.dart';

class AuthService extends GetxService {
  bool isAuthenticated = false;

  Future<void> login(String username, String password) async {
    // Lógica de autenticação (exemplo básico)
    await Future.delayed(const Duration(seconds: 1));
    isAuthenticated = true;
  }

  Future<void> logout() async {
    // Lógica de logout (exemplo básico)
    await Future.delayed(const Duration(seconds: 1));
    isAuthenticated = false;
  }
}
