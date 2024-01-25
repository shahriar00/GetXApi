import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getxapi/user_detail/controller/user_detail_controller.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  var userController = Get.put(UserDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return ListView.builder(
        itemCount: userController.userList.length,
        itemBuilder: (context,index) {
          return Padding(padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.blue,
            child: ListTile(
              title: Text(userController.userList[index].name),
              subtitle: Text(userController.userList[index].email),
            ),
          ),);
        },
      );
    }));
  }
}
