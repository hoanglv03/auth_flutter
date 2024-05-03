import 'package:auth_flutter_with_firebase/auth/entities/user_entities.dart';
import 'package:auth_flutter_with_firebase/pages/home/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthControllerNotifier extends StateNotifier<bool> {
  AuthControllerNotifier(this.ref) : super(false);
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final Ref ref;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailControllerSignUp = TextEditingController();
  final TextEditingController _passwordControllerSighUp =
      TextEditingController();
  final TextEditingController _nameControllerSignUp = TextEditingController();
  bool isKeepMeSignedIn = false;

  bool isSendEmail = false;

  void handleKeepMeSignedIn(bool? value) {
    if (value != isKeepMeSignedIn) {
      state = value ?? false;
      print(isKeepMeSignedIn);
    }
  }

  void handleSendEmail(bool? value) {
    isSendEmail = value ?? false;
  }

  bool isPasswordCompliant(String password) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters;
  }

  bool validateFormSignUp() {
    String? message;
    if (_nameControllerSignUp.text.isEmpty) {
      message = "Please enter username";
    } else if (!EmailValidator.validate(_emailControllerSignUp.text)) {
      message = "Email is valid";
    } else if (_passwordControllerSighUp.text.length < 6) {
      message = "Password contains minimum 7 characters";
    } else if (!isPasswordCompliant(_passwordControllerSighUp.text)) {
      message =
          "Password should contain at least one number, one lowercase, one uppercase and one special character";
    } else {
      return true;
    }
    EasyLoading.showToast(message);
    return false;
  }

  Future<void> signInWithEmailAndPassword() async {
    if (!validateFormSignUp()) {
      return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailControllerSignUp.text,
        password: _passwordControllerSighUp.text,
      )
          .then((value) async {
        String? uuid = value.user?.uid;
        if (uuid != null) {
          final user = <String, dynamic>{
            "uuid": uuid,
            "username": _nameControllerSignUp.text,
            "email": value.user!.email,
            "is_active": false,
            "first_name": "",
            "last_name": "",
            "phone_number": null,
            "avatar_url": "",
            "created_at": DateTime.now().millisecondsSinceEpoch,
            "updated_at": "",
            "deleted_at": "",
            "send_email": isSendEmail
          };
          await db.collection("users").doc(uuid).set(user);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    // final OAuthCredential credential =
    //     FacebookAuthProvider.credential(result.accessToken!.token);
    final OAuthCredential credential = FacebookAuthProvider.credential(
        "EAALJc0tqDSsBOzZB7Mm1zC0OfuSc8eZCoJPP3ZBVIS1FZCHk0KP3gamiYx8RPnnuZAC7TEk1ZCZBNZB0rweNyeLEKwk8PkcUlfd7PTGnyaMXIa1lSZCLC49jBJHcn2LR5J8MBXaHO455Nkkz2QyWgHjYRl869At5s9xINMWEZAVzlqZAB0ijEyWHuUZCELCbLM7WYXgv6nHVJoMKLWpUcP2tVeCR55vd5nerA2vgj0vZAaC01NefRAqAUrmAtQfbL6TAv7gZDZD");
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      // try {
      //   if (value.user!.emailVerified == false) {
      //     await value.user!.sendEmailVerification();
      //   }
      // } on FirebaseAuthException catch (e) {
      //   print(e.code);
      // } catch (e) {
      //   print(e.toString());
      // }
      if (value.user?.email != null) {
        Get.to(() => HomeView());
      }

      return value;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      String? email = value.user?.email;
      // if (email != null) {
      //   state = state?.copyWith(email: email);
      //   Get.to(() => HomeView());
      // }
      return value;
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool getKeepMeSignedIn() {
    return isKeepMeSignedIn;
  }

  TextEditingController getEmailControllerSignUp() {
    return _emailControllerSignUp;
  }

  TextEditingController getPasswordControllerSignUp() {
    return _passwordControllerSighUp;
  }

  TextEditingController getNameControllerSignUp() {
    return _nameControllerSignUp;
  }

  TextEditingController getEmailEditingController() {
    return _emailController;
  }

  TextEditingController getPasswordEditingController() {
    return _passwordController;
  }
}
