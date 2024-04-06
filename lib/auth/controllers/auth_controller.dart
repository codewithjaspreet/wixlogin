import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wixlogin/dashboard/home_screen.dart';
import 'package:wixlogin/utils/api_service.dart';

class AuthController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  static AuthController get instance => Get.find();

  // email controller

  final emailController = TextEditingController();

  // password controller

  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void loginWithEmailAndPassword(String email, String password) async {
    //  post request to login user into erpnext portal

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Email or Password cannot be empty', '');
      return;
    }

    try {
      Set response = await THttpHelper.post(
          'auth/login', {"email": email, "password": password});

      if (response.elementAt(0) == 200) {
        print(response.elementAt(1)['token']);

        // Update values if they differ
        GetStorage().write('isLoggedIn', true);
        GetStorage().write('token', response.elementAt(1)['token']);

        Get.snackbar('Great', 'Login Successfully');

        Get.to(() => HomeScreen());
      }
    } catch (e) {
      print(e);
      Get.snackbar('Invalid Credentials or User does not exist !', '');
    }
  }
}
