import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/user.dart';

class UserApiProvider {
  late List<User> _users;

  UserApiProvider() {
    _users = [];
    _init();
  }

  Future<void> _init() async {
    try {
      String jsonData =
          await rootBundle.loadString('lib/app/data/database/database.json');
      Map<String, dynamic> data = json.decode(jsonData);
      List<dynamic> usersJson = data['users'] ?? [];

      _users = usersJson.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao carregar dados do arquivo JSON: $e');
    }
  }

  List<User> getUsers() {
    return _users;
  }

  Future<void> addUser(User newUser) async {
    try {
      _users.add(newUser);
      await _saveData();
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }

  Future<void> updateUser(User updatedUser) async {
    try {
      int index = _users.indexWhere((user) => user.id == updatedUser.id);
      if (index != -1) {
        _users[index] = updatedUser;
        await _saveData();
      }
    } catch (e) {
      print('Erro ao atualizar usuário: $e');
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      _users.removeWhere((user) => user.id == userId);
      await _saveData();
    } catch (e) {
      print('Erro ao deletar usuário: $e');
    }
  }

  Future<void> _saveData() async {
    try {
      String jsonData =
          json.encode({'users': _users.map((user) => user.toJson()).toList()});
      // Escrever de volta no arquivo no assets não é possível diretamente
      // Normalmente você gravaria em um local de armazenamento persistente, como o diretório de documentos do dispositivo
    } catch (e) {
      print('Erro ao salvar dados no arquivo JSON: $e');
    }
  }
}
