import 'package:dating_app/Core/Routes/app_routes.dart';
import 'package:dating_app/Core/Services/shared_preferance.dart';
import 'package:dating_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:dating_app/Core/Routes/routes.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefResponse.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _prefns = SharedPrefResponse.instance;

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeController.themeMode,
      // home: const LoginScreenView(),
      initialRoute: _prefns.getAccessToken == null
          ? route.kloginScreen
          : route.kBottomAppBar,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
