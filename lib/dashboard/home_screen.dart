import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wixlogin/auth/controllers/auth_controller.dart';
import 'package:wixlogin/auth/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  AuthController authController = Get.put(AuthController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              homeController.clientId.value,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              homeController.userName.value,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
