import 'package:auth_flutter_with_firebase/auth/onboardings/onboarding.dart';
import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_view.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_process.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_set_location.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_successfully.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_upload_image.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_verify_code.dart';
import 'package:auth_flutter_with_firebase/auth/sign_up/sign_up_view.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: GetMaterialApp(
        initialRoute: '/',
        builder: EasyLoading.init(),
        getPages: [
          GetPage(name: '/', page: () => const MyHomePage()),
          GetPage(name: AppRouters.signIn, page: () => const SignInView()),
          GetPage(name: AppRouters.signUp, page: () => const SignUp()),
          GetPage(
              name: AppRouters.signUpProcess,
              page: () => const SignUpProcess()),
          GetPage(
              name: AppRouters.signUploadImage,
              page: () => const SignUpUploadImage()),
          GetPage(
              name: AppRouters.signUpSetLocation,
              page: () => const SignUpSetLocation()),
          GetPage(
              name: AppRouters.signUpVerifyCode,
              page: () => const SignUpVerifyCode()),
          GetPage(
              name: AppRouters.signUpSuccessfully,
              page: () => const AuthSuccessfully()),
        ],
      ),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoarding()),
    );
  }
}
