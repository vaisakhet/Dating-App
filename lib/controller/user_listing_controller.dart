import 'package:dating_app/Core/Model/all_user_list_model.dart';
import 'package:dating_app/Core/Services/api/login_api.dart';
import 'package:get/get.dart';

class AllUsersController extends GetxController {
  bool isLoading = false;

  AllUserList? allUsers;
  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }

  Future<void> getAllUsers() async {
    isLoading = true;
    try {
      var data = await ApiServices().fetchAllUsers();

      if (data != null) {
        allUsers = data;
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print("<<<<<<<<${e.toString()}#########");
    }
  }
}
