import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_set_location.dart';
import 'package:auth_flutter_with_firebase/components/background.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:auth_flutter_with_firebase/helpers/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignUpSetLocation extends ConsumerStatefulWidget {
  const SignUpSetLocation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpSetLocationState();
}

class _SignUpSetLocationState extends ConsumerState<SignUpSetLocation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? address = ref.watch(setLocationProvider);
    return Background(
      onTab: () => {Get.back()},
      viewBottom: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ButtonGradient(
          textButton: AppAuthText.next,
          onPressed: () =>
              {ref.read(authControllerProvider.notifier).handleSaveLocation()},
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
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 147,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: [
                        Image.asset(AppImage.pin),
                        const SizedBox(width: 14),
                        Text(
                          address ?? AppAuthText.yourLocation,
                          style: AppTextStyle.bold15,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 57,
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(authControllerProvider.notifier)
                            .getCurrentLocation();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        AppAuthText.setLocationButton,
                        style: AppTextStyle.bold14,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
