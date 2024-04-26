import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_logic.dart';
import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final SignUpState state = Get.find<SignUpLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Text(state.socialAccount.value!.user!.email ?? "hi");
  }
}
