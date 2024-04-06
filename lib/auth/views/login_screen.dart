import 'package:flutter/material.dart';
import 'package:wixlogin/auth/widgets/login_form.dart';
import 'package:wixlogin/auth/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginHeader(),
                LoginForm(),
                // const DividerComponent(
                //   dividerText: TTexts.orSignInWith,
                // ),
                // const SizedBox(
                //   height: TSizes.spaceBtwSections,
                // ),
                // const SocialButtons()
              ],
            )),
      ),
    );
  }
}
