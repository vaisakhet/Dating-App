import 'package:dating_app/Views/bottom_app_bar_screen.dart';
import 'package:dating_app/Views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/Core/Routes/routes.dart' as route;

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case route.kloginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreenView();
          },
        );

      case route.kBottomAppBar:
        return MaterialPageRoute(
          builder: (context) {
            return const BottomAppBr();
          },
        );

      // case route.kotpScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return OtpScreenView();
      //     },
      //   );
      // case route.kFirstScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const FirstScreen();
      //     },
      //   );

      // case route.kFogotScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const ForgotPasswordScreenView();
      //     },
      //   );
    }

    return null;
  }
}
