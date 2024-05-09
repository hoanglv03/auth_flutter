import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/components/background.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/components/button_image.dart';
import 'package:auth_flutter_with_firebase/components/text_input.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignUpUploadImage extends ConsumerStatefulWidget {
  const SignUpUploadImage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpUploadImageState();
}

class _SignUpUploadImageState extends ConsumerState<SignUpUploadImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      onTab: () => {Get.back()},
      viewBottom: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ButtonGradient(
          textButton: AppAuthText.next,
          onPressed: () =>
              {ref.read(authControllerProvider.notifier).updateProfile()},
          width: 175,
          height: 57,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              AppAuthText.uploadPhoto,
              style: AppTextStyle.bold25,
            ),
            const SizedBox(height: 19),
            const Text(
              AppAuthText.signUpProcessSubTitle,
              style: AppTextStyle.regular12,
            ),
            const SizedBox(height: 20),
            ButtonImage(
              onPressed: () {
                ref.read(authControllerProvider.notifier).getLostData();
              },
              textButton: AppAuthText.fromGallery,
              images: AppImage.gallery,
            ),
            const SizedBox(height: 20),
            ButtonImage(
              onPressed: () {},
              textButton: AppAuthText.takePhoto,
              images: AppImage.camera,
            )
          ],
        ),
      ),
    );
  }
}
