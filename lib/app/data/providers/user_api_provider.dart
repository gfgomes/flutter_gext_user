import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../models/user.dart';

class UserApiProvider {
  late List<User> _users;
  late String _filePath;
  final Uuid _uuid = const Uuid();

  UserApiProvider() {
    _users = [];
    _init();
  }

  Future<void> _init() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      _filePath = '${directory.path}/database.json';

      final file = File(_filePath);
      if (await file.exists()) {
        String jsonData = await file.readAsString();
        _loadUsersFromJson(jsonData);
      } else {
        String jsonData =
            await rootBundle.loadString('lib/app/data/database/database.json');
        await file.writeAsString(jsonData);
        _loadUsersFromJson(jsonData);
      }
    } catch (e) {
      print('Erro ao inicializar dados: $e');
    }
  }

  void _loadUsersFromJson(String jsonData) {
    Map<String, dynamic> data = json.decode(jsonData);
    List<dynamic> usersJson = data['users'] ?? [];
    _users = usersJson.map((json) => User.fromJson(json)).toList();
  }

  List<User> getUsers() {
    return _users;
  }

  Future<void> addUser(User newUser) async {
    try {
      newUser.uuid = _uuid.v4(); // Gera um novo UUID para o usuário
      _users.add(newUser);
      await _saveData();
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }

  Future<void> updateUser(User updatedUser) async {
    try {
      int index = _users.indexWhere((user) => user.uuid == updatedUser.uuid);
      if (index != -1) {
        _users[index] = updatedUser;
        await _saveData();
      }
    } catch (e) {
      print('Erro ao atualizar usuário: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      _users.removeWhere((user) => user.uuid == userId);
      await _saveData();
    } catch (e) {
      print('Erro ao deletar usuário: $e');
    }
  }

  Future<void> _saveData() async {
    try {
      String jsonData =
          json.encode({'users': _users.map((user) => user.toJson()).toList()});
      final file = File(_filePath);
      await file.writeAsString(jsonData);
    } catch (e) {
      print('Erro ao salvar dados no arquivo JSON: $e');
    }
  }
}
