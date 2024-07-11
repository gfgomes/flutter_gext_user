import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/routes/app_routes.dart';
import 'package:flutter_gext_user/app/ui/widgets/user_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final User user = userController.users[index];
              return UserItem(user: user);
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.USER_FORM);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
