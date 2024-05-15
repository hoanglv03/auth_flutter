import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_email_me.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_eye_password.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_keep_me_sign_in.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/components/text_input.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController =
        ref.read(authControllerProvider.notifier).getEmailControllerSignUp();
    _passwordController =
        ref.read(authControllerProvider.notifier).getPasswordControllerSignUp();
    _nameController =
        ref.read(authControllerProvider.notifier).getNameControllerSignUp();
  }

  @override
  Widget build(BuildContext context) {
    bool keepMeSignIn = ref.watch(keepMeSignInControllerProvider);
    bool emailMe = ref.watch(emailMeControllerProvider);
    bool showPassword = ref.watch(eyePasswordControllerProvider);

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
                      textController: _nameController,
                      hint: "Anamwp . . ",
                      iconLeft: Image.asset(AppImage.profile),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInput(
                      textController: _emailController,
                      hint: "Email",
                      iconLeft: Image.asset(AppImage.message),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInput(
                      textController: _passwordController,
                      hint: "Password",
                      iconLeft: Image.asset(AppImage.lock),
                      isPassword: showPassword,
                      iconRight: GestureDetector(
                        onTap: () {
                          ref
                              .read(eyePasswordControllerProvider.notifier)
                              .handle();
                        },
                        child: showPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.remove_red_eye),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _checkBox(
                      title: "Keep Me Signed In",
                      isChecked: keepMeSignIn,
                      onChange: (value) {
                        ref
                            .read(keepMeSignInControllerProvider.notifier)
                            .handle();
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    _checkBox(
                      title: "Email Me About Special Pricing",
                      isChecked: emailMe,
                      onChange: (value) {
                        ref.read(emailMeControllerProvider.notifier).handle();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonGradient(
                      textButton: "Create Account",
                      onPressed: () => {
                        ref
                            .read(authControllerProvider.notifier)
                            .signInWithEmailAndPassword()
                      },
                      width: 175,
                      height: 57,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => {Get.offAllNamed(AppRouters.signIn)},
                      child: Text(
                        'already have an account?',
                        style: AppTextStyle.linearTextUnderline,
                      ),
                    ),
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

class _checkBox extends StatelessWidget {
  const _checkBox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChange,
  });
  final String title;
  final bool isChecked;
  final Function(bool?) onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
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
              side: const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
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
            value: isChecked,
            side: const BorderSide(color: Colors.transparent),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.transparent;
              }
              return null;
            }),
            onChanged: (value) {
              onChange(value);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: AppTextStyle.regular14Gray,
          ),
        ),
      ],
    );
  }
}
