import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_logic.dart';
import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_state.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_view.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/components/text_input.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignUpLogic logic = Get.put(SignUpLogic());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              AppImage.backgroundImage,
              scale: 0.3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImage.logoApp,
                        scale: 2.5,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Login To Your Account",
                      style: AppTextStyle.bold24,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextInput(
                      textController: _emailController,
                      hint: "Email",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInput(
                      textController: _passwordController,
                      hint: "Password",
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        "Or Continue With",
                        style: AppTextStyle.bold12,
                      ),
                    ),
                    _socialMedia(),
                    Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Forgot Your Password?',
                              style: AppTextStyle.linearText,
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => const SignUp()),
                              child: Text(
                                'Sign Up?',
                                style: AppTextStyle.linearText,
                              ),
                            ),
                          ],
                        )),
                    ButtonGradient(
                      textButton: "Login",
                      onPressed: () => {},
                      width: 157,
                      height: 57,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _socialMedia() {
    Future<UserCredential> user;
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              await logic.signInWithFacebook();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF4F4F4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImage.facebook),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "Facebook",
                    style: AppTextStyle.medium14,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 21,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              await logic.signInWithGoogle();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF4F4F4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImage.google),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "Google",
                    style: AppTextStyle.medium14,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
