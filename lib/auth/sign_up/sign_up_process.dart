import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/components/background.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:auth_flutter_with_firebase/components/text_input.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpProcess extends ConsumerStatefulWidget {
  const SignUpProcess({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpProcessState();
}

class _SignUpProcessState extends ConsumerState<SignUpProcess> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _firstNameController = ref
        .read(authControllerProvider.notifier)
        .getFirstNameEditingController();
    _lastNameController = ref
        .read(authControllerProvider.notifier)
        .getLastNameEditingController();
    _phoneNumberController = ref
        .read(authControllerProvider.notifier)
        .getPhoneNumberEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      viewBottom: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ButtonGradient(
          textButton: AppAuthText.next,
          onPressed: () => {},
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
              AppAuthText.signUpProcessTitle,
              style: AppTextStyle.bold25,
            ),
            const SizedBox(height: 19),
            const Text(
              AppAuthText.signUpProcessSubTitle,
              style: AppTextStyle.regular12,
            ),
            const SizedBox(height: 20),
            TextInput(
              textController: _firstNameController,
              hint: AppAuthText.firstName,
            ),
            const SizedBox(height: 20),
            TextInput(
              textController: _lastNameController,
              hint: AppAuthText.lastName,
            ),
            const SizedBox(height: 20),
            TextInput(
              textController: _phoneNumberController,
              hint: AppAuthText.phoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
