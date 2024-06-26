import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/components/text_input.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController =
        ref.read(authControllerProvider.notifier).getEmailEditingController();
    _passwordController = ref
        .read(authControllerProvider.notifier)
        .getPasswordEditingController();
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
                              onTap: () => Get.offAllNamed(AppRouters.signUp),
                              child: Text(
                                'Sign Up?',
                                style: AppTextStyle.linearText,
                              ),
                            ),
                          ],
                        )),
                    ButtonGradient(
                      textButton: "Login",
                      onPressed: () =>
                          {ref.read(authControllerProvider.notifier).signIn()},
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
            onTap: () {
              ref.read(authControllerProvider.notifier).signInWithFacebook();
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
            onTap: () {
              ref.read(authControllerProvider.notifier).signInWithGoogle();
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
