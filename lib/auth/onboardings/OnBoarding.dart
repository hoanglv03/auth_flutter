import 'package:auth_flutter_with_firebase/auth/signup/SignUp.dart';
import 'package:auth_flutter_with_firebase/components/ButtonGradient.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  late PageController _pageViewController;
  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageViewController,
      children: [
        _Page1(),
        _Page2(),
      ],
    );
  }

  Widget _Page1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image.asset(AppImage.onboarding_1),
      ),
      const SizedBox(height: 40),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          "Find your  Comfort Food here",
          style: AppTextStyle.bold30,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          "Here You Can find a chef or dish for every taste and color. Enjoy!",
          style: AppTextStyle.regular14,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 30),
      ButtonGradient(
        textButton: "Next",
        onPressed: () => {_handlePageViewChanged(1)},
        width: 157,
        height: 57,
      )
    ]);
  }

  Widget _Page2() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Image.asset(AppImage.onboarding_2),
      ),
      const SizedBox(height: 7),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Food Ninja is Where Your Comfort Food Lives",
          style: AppTextStyle.bold30,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          "Enjoy a fast and smooth food delivery at your doorstep",
          style: AppTextStyle.regular14,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 30),
      ButtonGradient(
        textButton: "Next",
        onPressed: () => {Get.to(() => SignUp())},
        width: 157,
        height: 57,
      )
    ]);
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _pageViewController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
