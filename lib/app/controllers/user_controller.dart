import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/data/providers/user_api_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserApiProvider _userService = UserApiProvider();
  final users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final List<User> fetchedUsers = await _userService.getUsers();
    users.assignAll(fetchedUsers);
  }

  Future<void> addUser(User newUser) async {
    await _userService.addUser(newUser);
    fetchUsers();
  }

  Future<void> updateUser(User updatedUser) async {
    await _userService.updateUser(updatedUser);
    fetchUsers();
  }

  Future<void> deleteUser(int userId) async {
    await _userService.deleteUser(userId);
    fetchUsers();
  }
}
