import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_logic.dart';
import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_state.dart';
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

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      "Sign Up For Free",
                      style: AppTextStyle.bold24,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextInput(
                      textController: _emailController,
                      hint: "Anamwp . . ",
                      iconLeft: Image.asset(AppImage.profile),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInput(
                      textController: _passwordController,
                      hint: "Email",
                      iconLeft: Image.asset(AppImage.message),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInput(
                      textController: _emailController,
                      hint: "Password",
                      iconLeft: Image.asset(AppImage.lock),
                      isPassword: true,
                      iconRight: const Icon(Icons.remove_red_eye),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(0.99, -0.15),
                              end: Alignment(-0.99, 0.15),
                              colors: AppTextStyle.listColorGradient,
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFF4F4F4)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x115A6CEA),
                                blurRadius: 50,
                                offset: Offset(12, 26),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Checkbox(
                            value: false,
                            side: const BorderSide(color: Colors.transparent),
                            fillColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.transparent;
                              }
                              return null;
                            }),
                            onChanged: (value) {},
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Text(
                            "Keep Me Signed In",
                            style: AppTextStyle.bold12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        "Or Continue With",
                        style: AppTextStyle.bold12,
                      ),
                    ),
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
}
