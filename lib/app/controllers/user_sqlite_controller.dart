import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserSqliteController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await _userRepository.init();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final List<User> fetchedUsers = await _userRepository.getUsers();
    users.assignAll(fetchedUsers);
  }

  Future<void> addUser(User newUser) async {
    await _userRepository.addUser(newUser);
    fetchUsers();
  }

  Future<void> updateUser(User updatedUser) async {
    await _userRepository.updateUser(updatedUser);
    fetchUsers();
  }

  Future<void> deleteUserByUuid(String userUuid) async {
    await _userRepository.deleteUserByUuid(userUuid);
    fetchUsers();
  }

  Future<void> deleteUserById(int userId) async {
    await _userRepository.deleteUserById(userId);
    fetchUsers();
  }
}
