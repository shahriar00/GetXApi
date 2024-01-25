import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:getxapi/user_detail/model/user_detail_data.dart'; // Add this import for json.decode

class ApiService {
  Future<List<UserDetailModel>> fetchData() async {
    try {
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      if (response.statusCode == 200) {
        
        List<dynamic> jsonList = json.decode(response.body);
        List<UserDetailModel> userList = jsonList.map((json) => UserDetailModel.fromJson(json)).toList();

        return userList;
      } else {
        throw Exception("Network Error");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
