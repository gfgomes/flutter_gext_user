import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:get/get.dart';

class UserFormPage extends StatelessWidget {
  final UserController userController = Get.find();
  final User? user;

  UserFormPage({super.key, this.user});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      _nameController.text = user!.name;
      _emailController.text = user!.email;
      _ageController.text = user!.age.toString();
      _genderController.text = user!.gender;
      _countryController.text = user!.country;
      _cityController.text = user!.city;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? 'Adicionar Usuário' : 'Editar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _genderController,
                decoration: const InputDecoration(labelText: 'Gênero'),
              ),
              TextFormField(
                controller: _countryController,
                decoration: const InputDecoration(labelText: 'País'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Limpar campos
                      _nameController.clear();
                      _emailController.clear();
                      _ageController.clear();
                      _genderController.clear();
                      _countryController.clear();
                      _cityController.clear();
                    },
                    child: const Text('Limpar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Salvar usuário
                      final newUser = User(
                        id: user != null ? user!.id : 0,
                        name: _nameController.text,
                        email: _emailController.text,
                        age: int.tryParse(_ageController.text) ?? 0,
                        gender: _genderController.text,
                        country: _countryController.text,
                        city: _cityController.text,
                      );

                      if (user == null) {
                        userController.addUser(newUser);
                      } else {
                        userController.updateUser(newUser);
                      }

                      Get.back();
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
