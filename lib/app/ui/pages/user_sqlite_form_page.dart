import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_sqlite_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class UserSqliteForm extends StatelessWidget {
  final UserSqliteController userSqliteController = Get.find();
  final User? user = Get.arguments;

  UserSqliteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: user?.name ?? '');
    final TextEditingController emailController =
        TextEditingController(text: user?.email ?? '');
    final TextEditingController ageController =
        TextEditingController(text: user?.age.toString() ?? '');
    // Use ValueNotifier for gender and country
    final ValueNotifier<String?> genderNotifier =
        ValueNotifier<String?>(user?.gender);
    final ValueNotifier<String?> countryNotifier =
        ValueNotifier<String?>(user?.country);

    final TextEditingController cityController =
        TextEditingController(text: user?.city ?? '');

    final List<String> genders = ['Masculino', 'Feminino'];
    final List<String> countries = ['Brasil', 'Argentina'];

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(user == null
            ? 'Adicionar Usuário Sqlite'
            : 'Editar Usuário Sqlite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
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
                ValueListenableBuilder<String?>(
                  valueListenable: genderNotifier,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                      value: value,
                      items: genders.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        genderNotifier.value = newValue;
                      },
                      decoration: const InputDecoration(labelText: 'Gênero'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecione um gênero';
                        }
                        return null;
                      },
                    );
                  },
                ),
                ValueListenableBuilder<String?>(
                  valueListenable: countryNotifier,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                      value: value,
                      items: countries.map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        countryNotifier.value = newValue;
                      },
                      decoration: const InputDecoration(labelText: 'País'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecione um país';
                        }
                        return null;
                      },
                    );
                  },
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'Cidade'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma cidade';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                        // Limpar campos
                        nameController.clear();
                        emailController.clear();
                        ageController.clear();
                        genderNotifier.value = null;
                        countryNotifier.value = null;
                        cityController.clear();
                      },
                      child: const Text('Limpar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validar formulário
                        if (formKey.currentState!.validate()) {
                          // Salvar usuário
                          final newUser = User(
                            id: user?.id,
                            uuid: user != null
                                ? user!.uuid.toString()
                                : const Uuid().v4(),
                            name: nameController.text,
                            email: emailController.text,
                            age: int.tryParse(ageController.text) ?? 0,
                            gender: genderNotifier.value ?? '',
                            country: countryNotifier.value ?? '',
                            city: cityController.text,
                          );

                          if (user == null) {
                            userSqliteController.addUser(newUser);
                          } else {
                            userSqliteController.updateUser(newUser);
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
      ),
    );
  }
}
