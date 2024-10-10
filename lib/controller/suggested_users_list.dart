import 'package:dating_app/Core/Model/suggested_user_list.dart';
import 'package:dating_app/Core/Services/api/login_api.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SuggestedUsersController extends GetxController {
  bool isLoading = false;

  SuggestedUserList? suggestedUserList;
  @override
  void onInit() {
    getSuggestedUsers();
    super.onInit();
  }

  Future<void> getSuggestedUsers() async {
    isLoading = true;
    try {
      var data = await ApiServices().fetchSuggestedUserList();

      if (data != null) {
        suggestedUserList = data;
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
