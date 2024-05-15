import 'dart:async';
import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_set_location.dart';
import 'package:auth_flutter_with_firebase/components/background.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpVerifyCode extends ConsumerStatefulWidget {
  const SignUpVerifyCode({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpVerifyCodeState();
}

class _SignUpVerifyCodeState extends ConsumerState<SignUpVerifyCode> {
  final TextEditingController _codeController = TextEditingController();

  late Timer _timer;
  int _start = 60;
  String? phoneNumber;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    phoneNumber = ref.read(authControllerProvider.notifier).phoneNumber;
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
          onPressed: () => {
            ref
                .read(authControllerProvider.notifier)
                .verifyCode(_codeController.text)
          },
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
              AppAuthText.verifyCode,
              style: AppTextStyle.bold25,
            ),
            const SizedBox(height: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppAuthText.codeSend} $phoneNumber ${AppAuthText.expired}",
                  style: AppTextStyle.regular12,
                ),
                _start != 0
                    ? Text(
                        "${AppAuthText.resendAfter} ${_start}s",
                        style: AppTextStyle.regular12,
                      )
                    : GestureDetector(
                        onTap: () {
                          ref
                              .read(authControllerProvider.notifier)
                              .resendCode();
                          setState(() {
                            _start = 60;
                          });
                          startTimer();
                        },
                        child: Text(
                          AppAuthText.resend,
                          style: AppTextStyle.regularLiner12,
                        ))
              ],
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 103,
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  activeBorderWidth: 1,
                  activeColor: Colors.black12,
                  selectedColor: Colors.white,
                  selectedBorderWidth: 1,
                  errorBorderColor: Colors.white,
                  selectedFillColor: Colors.black12,
                  inactiveColor: Colors.white,
                  inactiveFillColor: Colors.black12,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: _codeController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  ref
                      .read(authControllerProvider.notifier)
                      .verifyCode(_codeController.text);
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {});
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
