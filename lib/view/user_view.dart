import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxapi/controller/user_controller.dart';

class UserViewDetails extends StatefulWidget {
  const UserViewDetails({super.key});

  @override
  State<UserViewDetails> createState() => _UserViewDetailsState();
}

class _UserViewDetailsState extends State<UserViewDetails> {
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (userController.isLoading == true) {
         const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          itemCount: userController.userList.length,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: ListTile(
                  title: Text(userController.userList[index].name),
                  subtitle: Text(userController.userList[index].email),
                ),
              ),
            );
          });
    }));
  }
}
