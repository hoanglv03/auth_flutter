import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SignUpState {
  late Rx<UserCredential?> socialAccount;

  SignUpState() {
    socialAccount = Rx<UserCredential?>(null);
  }
}
