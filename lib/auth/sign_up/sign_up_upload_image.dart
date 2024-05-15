import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_avatar_url.dart';
import 'package:auth_flutter_with_firebase/components/background.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/components/button_image.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
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
    String? avatarUrl = ref.watch(updateAvatarUrlProvider);
    return Background(
      onTab: () => {Get.back()},
      viewBottom: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ButtonGradient(
          textButton: AppAuthText.next,
          onPressed: () =>
              {ref.read(authControllerProvider.notifier).handleUploadImage()},
          width: 175,
          height: 57,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
            if (avatarUrl != null)
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Stack(
                      children: [
                        Image.network(
                          avatarUrl,
                          height: 238,
                          width: 245,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Colors.amber,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.white50,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.white80,
                              ),
                              onPressed: () {
                                ref
                                    .read(updateAvatarUrlProvider.notifier)
                                    .removeAvatarImage();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (avatarUrl == null)
              ButtonImage(
                onPressed: () {
                  ref.read(authControllerProvider.notifier).uploadImage();
                },
                textButton: AppAuthText.fromGallery,
                images: AppImage.gallery,
              ),
            const SizedBox(height: 20),
            if (avatarUrl == null)
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
