import 'package:get/get.dart';
import 'package:getxapi/user_detail/model/user_detail_data.dart';
import 'package:getxapi/user_detail/provider/user_api.dart';

class UserDetailController extends GetxController {
  var isLoading = true.obs;
  var userList = <UserDetailModel>[].obs;

  fetchUser() async {
    try {
      isLoading(true);
      var userData = await ApiService().fetchData();
      userList.addAll(userData as Iterable<UserDetailModel>);
    } catch (e) {
      print("Error $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchUser();
    // TODO: implement onInit
    super.onInit();
  }
}
