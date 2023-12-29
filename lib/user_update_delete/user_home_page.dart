import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxapi/user_update_delete/controller/user_details_controller.dart';

class UserDetailHomePage extends StatelessWidget {
  const UserDetailHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserDetailController userDetailController = Get.put(UserDetailController());

    TextEditingController userID = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Update and Delete Data from API"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userDetailController.nameController,
              decoration: InputDecoration(hintText: "name"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userDetailController.emailController,
              decoration: InputDecoration(hintText: "email"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userDetailController.genderController,
              decoration: InputDecoration(hintText: "gender"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userDetailController.statusController,
              decoration: InputDecoration(hintText: "status"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userID,
              decoration: InputDecoration(hintText: "user ID"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              userDetailController.fetchData(userID.text);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Get Data",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            color: Colors.blue,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              userDetailController.updateData(userID.text);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Update Data",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            color: Colors.blue,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              userDetailController.deleteData(userID.text);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Delete Data",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
