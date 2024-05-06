// ignore: file_names
import 'package:flutter/material.dart';

class AppImage {
  static const onboarding_1 = 'lib/assets/images/onboard_1.png';
  static const onboarding_2 = 'lib/assets/images/onboard_2.png';
  static const backgroundImage = 'lib/assets/images/icon_background.png';
  static const logoApp = 'lib/assets/images/Logo.png';
  static const google = 'lib/assets/images/google.png';
  static const facebook = 'lib/assets/images/facebook.png';
  static const lock = 'lib/assets/icons/lock.png';
  static const message = 'lib/assets/icons/message.png';
  static const profile = 'lib/assets/icons/profile.png';
}

class AppTextStyle {
  static const bold30 = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const bold24 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const bold12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const regular14Gray = TextStyle(
    color: Colors.black38,
    fontSize: 14,
  );
  static const regular12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
  static const bold25 =
      TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700);
  static const listColorGradient = <Color>[
    Color(0xff53E88B),
    Color(0xff15BE77)
  ];
  static const regular14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  static const medium14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  final Shader linearGradient = const LinearGradient(
    colors: listColorGradient,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final linearText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    foreground: Paint()..shader = AppTextStyle().linearGradient,
  );
  static final linearTextUnderline = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    foreground: Paint()..shader = AppTextStyle().linearGradient,
    decoration: TextDecoration.underline,
    decorationColor: const Color(0xff53E88B),
  );
}

class AppRouters {
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const signUpProcess = '/sign_up_process';
}

class AppColors {
  static const buttonBackgroundArrow = Color.fromARGB(66, 249, 169, 77);
  static const buttonArrow = Color(0xffDA6317);
}

class AppAuthText {
  static const signUpProcessTitle = "Fill in your bio to get\nstarted";
  static const signUpProcessSubTitle =
      "This data will be displayed in your account\nprofile for security";
  static const firstName = "First Name";
  static const lastName = "Last Name";
  static const email = "Email";
  static const password = "Password";
  static const phoneNumber = "Phone Number";
  static const next = "Next";
}
