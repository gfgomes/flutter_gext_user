import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/routes/app_routes.dart';
import 'package:get/get.dart';

class UserItemJsonWidget extends StatelessWidget {
  final User user;

  const UserItemJsonWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // Excluir usuário
          // Aqui você pode adicionar um dialog de confirmação, se necessário
          Get.find<UserJsonController>().deleteUserByUuid(user.uuid);
        },
      ),
      onTap: () {
        // Navegar para a página de edição do usuário
        Get.toNamed(Routes.USER_FORM_JSON, arguments: user);
      },
    );
  }
}
