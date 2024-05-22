import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AuthSuccessfully extends ConsumerStatefulWidget {
  const AuthSuccessfully({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthSuccessfullyState();
}

class _AuthSuccessfullyState extends ConsumerState<AuthSuccessfully> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImage.backgroundImage,
          scale: 0.6,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.icon_successfully,
                    scale: 0.8,
                  ),
                  Text(
                    AppAuthText.congrats,
                    style: AppTextStyle.linearText30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    AppAuthText.readyToUse,
                    style: AppTextStyle.bold23,
                  ),
                ],
              ),
              ButtonGradient(
                onPressed: () {
                  Get.offAllNamed(AppRouters.home);
                },
                textButton: "Try Order",
                height: 57,
                width: 157,
              )
            ],
          ),
        )
      ],
    );
  }
}
