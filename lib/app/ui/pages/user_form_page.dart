import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:get/get.dart';

class UserFormPage extends StatelessWidget {
  final UserController userController = Get.find();
  final User? user;

  UserFormPage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: user?.name ?? '');
    final TextEditingController emailController =
        TextEditingController(text: user?.email ?? '');
    final TextEditingController ageController =
        TextEditingController(text: user?.age.toString() ?? '');
    final TextEditingController genderController =
        TextEditingController(text: user?.gender ?? '');
    final TextEditingController countryController =
        TextEditingController(text: user?.country ?? '');
    final TextEditingController cityController =
        TextEditingController(text: user?.city ?? '');

    final List<String> genders = ['Masculino', 'Feminino'];
    final List<String> countries = ['Brasil', 'Argentina'];

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
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a idade';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: genderController.text.isEmpty
                    ? null
                    : genderController.text,
                items: genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    genderController.text = value;
                  }
                },
                decoration: const InputDecoration(labelText: 'Gênero'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um gênero';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: countryController.text.isEmpty
                    ? null
                    : countryController.text,
                items: countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    countryController.text = value;
                  }
                },
                decoration: const InputDecoration(labelText: 'País'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um país';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Limpar campos
                      nameController.clear();
                      emailController.clear();
                      ageController.clear();
                      genderController.clear();
                      countryController.clear();
                      cityController.clear();
                    },
                    child: const Text('Limpar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validar formulário
                      if (Form.of(context).validate()) {
                        // Salvar usuário
                        final newUser = User(
                          id: user != null ? user!.id : 0,
                          name: nameController.text,
                          email: emailController.text,
                          age: int.tryParse(ageController.text) ?? 0,
                          gender: genderController.text,
                          country: countryController.text,
                          city: cityController.text,
                        );

                        if (user == null) {
                          userController.addUser(newUser);
                        } else {
                          userController.updateUser(newUser);
                        }

                        Get.back();
                      }
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
