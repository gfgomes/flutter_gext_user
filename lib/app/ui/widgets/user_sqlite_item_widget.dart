import 'package:flutter/material.dart';
import 'package:flutter_gext_user/app/controllers/user_sqlite_controller.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';
import 'package:flutter_gext_user/app/routes/app_routes.dart';
import 'package:get/get.dart';

class UserSqliteItemWidget extends StatelessWidget {
  final User user;

  const UserSqliteItemWidget({super.key, required this.user});

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
          //Get.find<UserController>().deleteUser(user.uuid);
          Get.find<UserSqliteController>().deleteUserById(user.id!);
        },
      ),
      onTap: () {
        // Navegar para a página de edição do usuário
        Get.toNamed(Routes.USER_FORM_SQLITE, arguments: user);
      },
    );
  }
}
