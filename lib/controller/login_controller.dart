import 'dart:async';
import 'package:dating_app/Core/Services/shared_preferance.dart';
import 'package:dating_app/Core/Utils/api_end_points.dart';
import 'package:dating_app/Resorces/app_assets.dart';
import 'package:dating_app/Resorces/app_color.dart';
import 'package:dating_app/Views/bottom_app_bar_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class LoginController extends GetxController {
  final _prefns = SharedPrefResponse.instance;

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isDone = false;

  @override
  void onClose() {
    userNameController.clear();
    passwordController.clear();
    super.onClose();
  }

  Future<void> loginWithEmail(BuildContext context) async {
    isLoading = true;
    update();

    try {
      var url =
          Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoints.login);

      print("URL $url");
      print("User Name ${userNameController.text}");
      print("password ${passwordController.text}");

      Map<String, String> body = {
        'username': userNameController.text,
        'password': passwordController.text,
      };

      http.Response response = await http.post(url, body: body);

      print("Response ${response.statusCode}");
      print("Response body: ${response.body}");

      // Check if the response has content (status code 200 or 201) or no content (204)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response body only if it's not empty
        final results = jsonDecode(response.body);

        print("Login successful: $results");

        var accessToken = results['access'];
        _prefns.SetAcessToken(accessToken);
        _prefns.setEmail(userNameController.text);
        isDone = true;
        update();

        Get.off(() => const BottomAppBr(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 400));
      } else if (response.statusCode == 204) {
        // Handle the 204 No Content case separately
        print("No content in response.");
        isDone = false;
        update();
        Get.snackbar("Error", "No content returned from the server.");
      } else {
        isLoading = false;
        isDone = false;
        update();

        // Show error message from the response if available
        var errorMessage = jsonDecode(response.body)["data"] ?? "Unknown error";
        Get.snackbar("Error", errorMessage,
            colorText: AppColors.white,
            animationDuration: const Duration(milliseconds: 900),
            icon: SvgPicture.asset(
              AppAssets.bubblesIcon,
              color: AppColors.snackBarRed,
            ),
            backgroundColor: AppColors.snackBarRed,
            backgroundGradient: const LinearGradient(colors: [
              AppColors.snackBardarkRed,
              AppColors.snackBarRed,
            ]),
            isDismissible: true,
            dismissDirection: DismissDirection.startToEnd,
            snackStyle: SnackStyle.FLOATING,
            shouldIconPulse: true,
            mainButton: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.failIcon,
                    height: 40,
                  ),
                  Positioned(
                      top: 10,
                      child: SvgPicture.asset(
                        AppAssets.closeIcon,
                        height: 16,
                      )),
                ],
              ),
            ));
      }
    } catch (e) {
      print("Exception occurred: $e");
      Get.snackbar("Error", "An error occurred during login.");
    } finally {
      isLoading = false;
      update();
    }
  }
}
