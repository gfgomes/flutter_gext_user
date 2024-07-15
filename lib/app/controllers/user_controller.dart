import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/data/providers/user_api_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserApiProvider _userApiProvider = UserApiProvider();
  final users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final List<User> fetchedUsers = _userApiProvider.getUsers();
    users.assignAll(fetchedUsers);
  }

  Future<void> addUser(User newUser) async {
    await _userApiProvider.addUser(newUser);
    fetchUsers();
  }

  Future<void> updateUser(User updatedUser) async {
    await _userApiProvider.updateUser(updatedUser);
    fetchUsers();
  }

  Future<void> deleteUser(String userUuid) async {
    await _userApiProvider.deleteUser(userUuid);
    fetchUsers();
  }
}
