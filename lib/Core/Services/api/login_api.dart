import 'package:dating_app/Core/Model/all_user_list_model.dart';
import 'package:dating_app/Core/Model/suggested_user_list.dart';
import 'package:dating_app/Core/Services/shared_preferance.dart';
import 'package:dating_app/Core/Utils/api_end_points.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final _prefns = SharedPrefResponse.instance;

  /// DashBoard API
  Future<AllUserList?> fetchAllUsers() async {
    var url =
        Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoints.userList);

    var header = {'Authorization': "Bearer ${_prefns.getAccessToken}"};

    var response = await http.get(url, headers: header);

    if (kDebugMode) {
      print("userList Status Code ::: ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      var jsonString = response.body;

      if (kDebugMode) {
        print("userList Response Body ::: ${jsonString} :::");
      }

      //return dashBoardFromJson(jsonString);
      return allUserListFromJson(jsonString);
    } else if (response.statusCode == 403) {
      print("Error :: 403");
    }
    return null;
  }

  Future<SuggestedUserList?> fetchSuggestedUserList() async {
    var url = Uri.parse(
        ApiEndPoint.baseUrl + ApiEndPoint.authEndPoints.suggestedUserList);

    var header = {'Authorization': "Bearer ${_prefns.getAccessToken}"};

    var response = await http.get(url, headers: header);

    if (kDebugMode) {
      print("suggestedUserList Status Code ::: ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      var jsonString = response.body;

      if (kDebugMode) {
        print("suggestedUserList Response Body ::: ${jsonString} :::");
      }

      //return dashBoardFromJson(jsonString);
      return suggestedUserListFromJson(jsonString);
    } else if (response.statusCode == 403) {
      print("Error :: 403");
    }
    return null;
  }
}
