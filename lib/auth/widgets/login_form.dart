import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wixlogin/auth/controllers/auth_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    GlobalKey<FormState> form = GlobalKey<FormState>();

    return Form(
        key: form,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                  controller: authController.emailController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 12),
                      prefixIcon: const Icon(Iconsax.direct_right),
                      labelText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                      obscureText: authController.isPasswordVisible.value,
                      controller: authController.passwordController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 12),
                          prefixIcon: const Icon(Iconsax.password_check4),
                          suffixIcon: GestureDetector(
                              onTap: () =>
                                  authController.togglePasswordVisibility(),
                              child: Icon(
                                authController.isPasswordVisible.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                              )),
                          labelText: 'Password'),
                    )),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      authController.loginWithEmailAndPassword(
                          authController.emailController.text,
                          authController.passwordController.text);
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Get.to(() => const SignUpScreen());
                    },
                    child: const Text('Create Account'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
