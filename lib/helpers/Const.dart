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
  static const camera = 'lib/assets/icons/camera.png';
  static const gallery = 'lib/assets/icons/gallery.png';
  static const pin = 'lib/assets/icons/pin.png';
  static const iconSuccessfully = 'lib/assets/icons/icon_successfully.png';
  static const iconNotification = 'lib/assets/icons/icon_notification.png';
  static const iconHomeActive = 'lib/assets/icons/icon_home_active.png';
  static const iconHomeInactive = 'lib/assets/icons/icon_home_inactive.png';
  static const iconCartActive = 'lib/assets/icons/icon_cart_active.png';
  static const iconCartInactive = 'lib/assets/icons/icon_cart_inactive.png';
  static const iconChatActive = 'lib/assets/icons/icon_chat_active.png';
  static const iconChatInActive = 'lib/assets/icons/icon_chat_inactive.png';
  static const iconProfileActive = 'lib/assets/icons/icon_profile_active.png';
  static const iconProfileInactive =
      'lib/assets/icons/icon_profile_inactive.png';
  static const backgroundHeader = "lib/assets/images/background_header.png";
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
  static const bold14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const bold15 = TextStyle(
    color: Colors.black,
    fontSize: 14,
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
  static final regularLiner12 = TextStyle(
    fontSize: 12,
    foreground: Paint()..shader = AppTextStyle().linearGradient,
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
  static final linearText30 = TextStyle(
    fontSize: 30,
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
  static const bold23 = TextStyle(
    color: Colors.black,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );
  static const bold31 = TextStyle(
    color: Colors.black,
    fontSize: 31,
    fontWeight: FontWeight.w800,
  );
}

class AppRouters {
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const signUpProcess = '/sign_up_process';
  static const signUploadImage = '/sign_up_upload_image';
  static const signUpSetLocation = '/sign_up_set_location';
  static const signUpVerifyCode = '/sign_up_verify_code';
  static const signUpSuccessfully = '/sign_up_successfully';
  static const home = '/home';
}

class AppColors {
  static const buttonBackgroundArrow = Color.fromARGB(66, 249, 169, 77);
  static const buttonArrow = Color(0xffDA6317);
  static const white80 = Color(0xffFEFEFF);
  static final Color white50 = white80.withOpacity(0.5);
  static const black = Colors.black;
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
  static const fromGallery = "From Gallery";
  static const takePhoto = "Take Photo";
  static const uploadPhoto = "Upload Your Photo\nProfile";
  static const setLocation = "Set Your Location";
  static const yourLocation = "Your Location";
  static const setLocationButton = "Set Location";
  static const verifyCode = "Enter 4-digit\nVerification code";
  static const codeSend = "Code send to";
  static const expired = "You not receive code?";
  static const congrats = "Congrats!";
  static const readyToUse = "Your Profile Is Ready To Use";
  static const resendAfter = "Resend after";
  static const resend = "Resend";
}

class AppHomeText {
  static const findYourFavoriteFood = "Find Your\nFavorite Food";
}
