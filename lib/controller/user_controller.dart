import 'package:get/get.dart';
import 'package:getxapi/model/user_model.dart';
import 'package:getxapi/service/api_service.dart';

class UserController extends GetxController {
  bool isLoading = true;
  var userList = <UserModel>[].obs;

  fetchUsers() async {
    try {
      isLoading = true;

      var userData = await ApiService().fetchUserData();
      userList.addAll(userData);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUsers();
    super.onInit();
  }
}
