import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gext_user/app/controllers/user_sqlite_controller.dart';

class HomeSqlitePage extends StatelessWidget {
  final UserSqliteController userSqliteController = Get.find();

  HomeSqlitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home SQLite'),
      ),
      body: Obx(() {
        if (userSqliteController.users.isEmpty) {
          return const Center(child: Text('No users found'));
        } else {
          return ListView.builder(
            itemCount: userSqliteController.users.length,
            itemBuilder: (context, index) {
              final user = userSqliteController.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        }
      }),
    );
  }
}
