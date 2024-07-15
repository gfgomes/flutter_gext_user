import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/routes/app_routes.dart';
import 'package:flutter_gext_user/app/ui/widgets/user_item_json_widget.dart';
import 'package:get/get.dart';

class HomePageJson extends StatelessWidget {
  final UserJsonController userController = Get.find();

  HomePageJson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários Json'),
      ),
      body: Obx(() {
        if (userController.users.isEmpty) {
          // return const Center(
          //     child: CircularProgressIndicator());
          return const Center(
              child: Text(
                  "Nenhum registro encontrado.")); // Indicator de carregamento
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final User user = userController.users[index];
              return UserItemJsonWidget(user: user);
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.USER_FORM_JSON);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
