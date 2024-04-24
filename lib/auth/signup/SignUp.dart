import 'package:auth_flutter_with_firebase/components/ButtonGradient.dart';
import 'package:auth_flutter_with_firebase/components/TextInput.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                        child: Text(
                          'Forgot Your Password?',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..shader = AppTextStyle().linearGradient),
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Row _socialMedia() {
    Future<UserCredential> user;
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
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
              signInWithGoogle();
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
