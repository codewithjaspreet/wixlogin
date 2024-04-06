import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wixlogin/auth/views/login_screen.dart';

void main() async {
  await GetStorage.init();

  final box = GetStorage();
  // Add listener for changes
  box.listenKey('full_name', (value) {
    // Handle user name changes here
    print('full_name changed: $value');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      // initialBinding: AppBinding(),
    );
  }
}
