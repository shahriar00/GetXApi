import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapi/model/user_model.dart';
import 'package:getxapi/user_update_delete/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserDetailController extends GetxController {
  UserDetailModel? userDetailModel;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  var token =
      "de76e3c995a7dee45a2f9c231f9337c964ef2948b135485c6c2f44e8317a3480";

  fetchData(String userId) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer$token"
      };

      http.Response response = await http.get(
          Uri.tryParse("https://gorest.co.in/public/v2/users/$userId")!,
          headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        userDetailModel = UserDetailModel.fromJson(result);
        nameController.text = result['name'];
        emailController.text = result['email'];
        genderController.text = result['gender'];
        statusController.text = result['status'];
      } else {
        print("error fetch Data");
      }
    } catch (e) {
      print(e);
    }
  }

  updateData(String userId) async {
    try {
      var body = {
        'name': nameController.text,
        'email': emailController.text,
        'gender': genderController.text,
        'status': statusController.text
      };
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer$token"
      };


      http.Response response = await http.put(
          Uri.tryParse("https://gorest.co.in/public/v2/users/$userId")!,
          body: jsonEncode(body),
          headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print("Data Updated");
        print(result);
        Get.snackbar("update", "Data Updated");
      } else {
        print("error fetch Data");
        Get.snackbar("error", "Data not Updated");
      }
    } catch (e) {
      print(e);
    }
  }

  deleteData(String userId) async {
    try {
   
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer$token"
      };

      http.Response response = await http.delete(
          Uri.tryParse("https://gorest.co.in/public/v2/users/$userId")!,
         
          headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
       
        print(result);
        Get.snackbar("delete", "Data Delete");
      } else {
        print("error fetch Data");
        Get.snackbar("error", "Data Deleted");
      }
    } catch (e) {
      print(e);
    }
  }
}
