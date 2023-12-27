import 'dart:ui';
import 'package:get/get.dart';
import 'package:getxapi/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> fetchUserData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      return throw Exception(Get.snackbar("Network error", "Network eror",colorText: Color(0xFF)));
    }
  }

  
}
