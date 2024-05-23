// ignore_for_file: invalid_return_type_for_catch_error, body_might_complete_normally_catch_error
import 'package:auth_flutter_with_firebase/auth/controllers/auth_avatar_url.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_email_me.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_keep_me_sign_in.dart';
import 'package:auth_flutter_with_firebase/auth/controllers/auth_set_location.dart';
import 'package:auth_flutter_with_firebase/auth/entities/user_entities.dart';
import 'package:auth_flutter_with_firebase/auth/enum/sign_up.dart';
import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:auth_flutter_with_firebase/helpers/helper.dart';
import 'package:auth_flutter_with_firebase/pages/home/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class AuthControllerNotifier extends StateNotifier<UserEntities?> {
  AuthControllerNotifier(this.ref) : super(null);
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final storage = FirebaseStorage.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final Ref ref;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailControllerSignUp = TextEditingController();
  final TextEditingController _passwordControllerSighUp =
      TextEditingController();
  final TextEditingController _nameControllerSignUp = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _codeVerify = TextEditingController();

  String? phoneNumber;
  late String _verificationId;

  bool isPasswordCompliant(String password) {
    if (password.isEmpty) {
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

  bool validateFormSignIn() {
    String? message;
    if (!EmailValidator.validate(_emailController.text)) {
      message = "Email is valid";
    } else if (_passwordController.text.length < 6) {
      message = "Password contains minimum 7 characters";
    } else if (!isPasswordCompliant(_passwordController.text)) {
      message =
          "Password should contain at least one number, one lowercase, one uppercase and one special character";
    } else {
      return true;
    }
    EasyLoading.showToast(message);
    return false;
  }

  Future<void> signInWithEmailAndPassword() async {
    EasyLoading.show(status: 'loading...');
    if (!validateFormSignUp()) {
      return;
    }
    try {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailControllerSignUp.text,
        password: _passwordControllerSighUp.text,
      )
          .then((value) async {
        String? uuid = value.user?.uid;
        if (uuid != null) {
          final UserEntities user = UserEntities(
            avatarUrl: null,
            uuid: uuid,
            username: _nameControllerSignUp.text,
            email: value.user!.email,
            isActive: false,
            firstName: null,
            lastName: null,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            phoneNumber: null,
            updatedAt: null,
            deletedAt: null,
            emailMe: ref.read(emailMeControllerProvider),
            keep_me_sign_in: ref.read(keepMeSignInControllerProvider),
            method_sign_in: MethodSignUp.email.name,
            address: null,
            isPhoneNumberVerified: null,
          );
          await db.collection("users").doc(uuid).set(user.toJson()).then(
                (value) => {
                  EasyLoading.dismiss(),
                  Get.toNamed(AppRouters.signUpProcess)
                },
              );
        }
      }).catchError((e) => EasyLoading.showToast(e?.message));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showToast('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    // final OAuthCredential credential =
    //     FacebookAuthProvider.credential(result.accessToken!.token);
    final OAuthCredential credential = FacebookAuthProvider.credential(
        "EAALJc0tqDSsBO9hJ0AZAYucq4KRm8SegzZCwdbbZAKiviP6bxCEyzQbfrsH2xAZCv5gHli8PTzkkCwhzZC1pqfxxmuqaooTTwkf8cxdFLNWZC29etZAP27cC2Qb0cJYV0Xg0E10tgnTDxAJAACkcHgzsqW0NdPf3n2ccCLJ2XpzzXHOd0TFDIV2OOkduIJw3ZCNbKeIZCskQB0aWJGkuya53I1hUQbrI0IMoHhSz1yJ7GPrzqgZAphFXhNquBD1WpxWwZDZD");
    try {
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        String? uuid = value.user?.uid;
        if (uuid != null) {
          await db.collection("users").doc(uuid).get().then((user) async {
            if (user.data() == null) {
              final UserEntities user = UserEntities(
                avatarUrl: null,
                uuid: uuid,
                username: null,
                email: value.user!.email,
                isActive: false,
                firstName: null,
                lastName: null,
                createdAt: DateTime.now().millisecondsSinceEpoch,
                phoneNumber: null,
                updatedAt: null,
                deletedAt: null,
                emailMe: true,
                keep_me_sign_in: true,
                method_sign_in: MethodSignUp.facebook.name,
                address: null,
                isPhoneNumberVerified: null,
              );
              await db.collection("users").doc(uuid).set(user.toJson()).then(
                    (value) => {
                      EasyLoading.dismiss(),
                      Get.toNamed(AppRouters.signUpProcess)
                    },
                  );
            } else {
              checkStepSignIn(value);
            }
          });
        }
      }).catchError((e) => EasyLoading.showToast(e?.message));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showToast('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle() async {
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

    try {
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        String? uuid = value.user?.uid;
        if (uuid != null) {
          await db.collection("users").doc(uuid).get().then((user) async {
            if (user.data() == null) {
              final UserEntities user = UserEntities(
                avatarUrl: null,
                uuid: uuid,
                username: null,
                email: value.user!.email,
                isActive: false,
                firstName: null,
                lastName: null,
                createdAt: DateTime.now().millisecondsSinceEpoch,
                phoneNumber: null,
                updatedAt: null,
                deletedAt: null,
                emailMe: true,
                keep_me_sign_in: true,
                method_sign_in: MethodSignUp.google.name,
                address: null,
                isPhoneNumberVerified: null,
              );
              await db.collection("users").doc(uuid).set(user.toJson()).then(
                    (value) => {
                      EasyLoading.dismiss(),
                      Get.toNamed(AppRouters.signUpProcess)
                    },
                  );
            } else {
              checkStepSignIn(value);
            }
          });
        }
      }).catchError((e) => EasyLoading.showToast(e?.message));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showToast('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfile() async {
    EasyLoading.show(status: 'loading...');
    bool validateFormProcess() {
      String message = '';
      if (_firstNameController.text.isEmpty ||
          _lastNameController.text.isEmpty ||
          _phoneNumberController.text.isEmpty) {
        message = "Please fill all fields";
      } else if (Helper.checkPhoneNumber(_phoneNumberController.text)) {
        message = "Phone number is valid";
      }
      if (message.isNotEmpty) {
        EasyLoading.showToast(message);
        return false;
      }
      return true;
    }

    if (!validateFormProcess()) {
      return;
    }
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await db.collection("users").doc(user.uid).update({
          "first_name": _firstNameController.text,
          "last_name": _lastNameController.text,
          "phone_number": _phoneNumberController.text,
          "is_email_verified": false
        }).then((value) {
          phoneNumber = _phoneNumberController.text;
          EasyLoading.showToast("Updated profile successfully");
          Get.toNamed(AppRouters.signUploadImage);
        }).catchError((e) {
          if (e.code == 'not-found') {
            EasyLoading.showToast("user was not found");
          }
        });
        EasyLoading.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? fileImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (fileImage != null) {
        UploadTask task = storage
            .ref('upload/images/${fileImage.name}')
            .putData(await fileImage.readAsBytes(),
                SettableMetadata(contentType: "image/jpg"));

        task.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
          switch (taskSnapshot.state) {
            case TaskState.running:
              final progress =
                  (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
              if (!progress.isNaN) {
                EasyLoading.showProgress(progress, status: 'uploading...');
              }
              break;

            case TaskState.paused:
              EasyLoading.showToast("Upload was pause");
              break;

            case TaskState.canceled:
              EasyLoading.showToast("Upload was canceled");
              break;

            case TaskState.error:
              EasyLoading.showError('Failed with Error');
              break;

            case TaskState.success:
              EasyLoading.showSuccess('Upload Successfully!');
              String avatarURl = await taskSnapshot.ref.getDownloadURL();
              ref.read(updateAvatarUrlProvider.notifier).updateUrl(avatarURl);
              break;
          }
        });
      }
    } catch (e) {
      print(e);
    }
    EasyLoading.dismiss();
  }

  Future<void> handleUploadImage() async {
    EasyLoading.show(status: 'loading...');
    try {
      final user = FirebaseAuth.instance.currentUser;
      String? url = ref.read(updateAvatarUrlProvider);
      if (user != null && url != null) {
        await db.collection("users").doc(user.uid).update({
          "avatar_url": url,
        }).then((value) {
          EasyLoading.showToast('Update profile successfully');
          Get.toNamed(AppRouters.signUpSetLocation);
        }).catchError((e) {
          EasyLoading.showError('Failed with Error');
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      String? currentAddress = await Helper.getAddressCurrentLocation();

      if (currentAddress != null) {
        ref.read(setLocationProvider.notifier).setLocation(currentAddress);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleSaveLocation() async {
    if (ref.read(setLocationProvider) == null) {
      EasyLoading.showToast("Please set location");
      return;
    }
    EasyLoading.show(status: 'loading...');
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await db.collection("users").doc(user.uid).update({
          "address": ref.read(setLocationProvider),
        }).then((value) async {
          EasyLoading.showToast("Updated location successfully");
          await sendCode(null)
              .then((value) => {Get.toNamed(AppRouters.signUpVerifyCode)});
        }).catchError((e) {
          if (e.code == 'not-found') {
            EasyLoading.showToast("user was not found");
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendCode(bool? resend) async {
    String? phoneNumberSend;
    try {
      if (phoneNumber == null) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final userGetFromDatabase = db.collection("users").doc(user.uid);
          await userGetFromDatabase.get().then(
            (DocumentSnapshot doc) {
              final data =
                  UserEntities.fromJson(doc.data() as Map<String, dynamic>);
              phoneNumberSend = data.phoneNumber;
            },
            onError: (e) => print("Error getting document: $e"),
          );
        }
      } else {
        phoneNumberSend = phoneNumber;
      }
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumberSend?.replaceFirst("0", "+84"),
        verificationCompleted: (PhoneAuthCredential credential) {},
        timeout: const Duration(seconds: 60),
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId;
          if (resend == null) {
            Get.toNamed(AppRouters.signUpVerifyCode);
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> resendCode() async {
    sendCode(true);
  }

  Future<void> verifyCode(String code) async {
    EasyLoading.show(status: 'loading...');
    try {
      if (code.length == 6) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: _verificationId, smsCode: code);
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.updatePhoneNumber(credential);
          await db
              .collection("users")
              .doc(user.uid)
              .update({"is_email_verified": true});
        }
        Get.offAllNamed(AppRouters.signUpSuccessfully);
      }
    } catch (e) {
      print(e);
    }
    EasyLoading.dismiss();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRouters.signIn);
  }

  Future<void> signOutFirebaseAuth() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> checkStepSignIn(UserCredential credential) async {
    try {
      final uuid = credential.user?.uid;
      final user = db.collection("users").doc(uuid);
      user.get().then(
        (DocumentSnapshot doc) async {
          final data =
              UserEntities.fromJson(doc.data() as Map<String, dynamic>);
          if (data.firstName == null) {
            Get.toNamed(AppRouters.signUpProcess);
          } else if (data.avatarUrl == null) {
            Get.toNamed(AppRouters.signUploadImage);
          } else if (data.address == null) {
            Get.toNamed(AppRouters.signUpSetLocation);
          } else if (data.isPhoneNumberVerified == false) {
            await sendCode(null)
                .then((value) => Get.toNamed(AppRouters.signUpVerifyCode));
          } else {
            Get.offAllNamed(AppRouters.home);
          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkProfile() async {
    try {
      final userLocal = FirebaseAuth.instance.currentUser;
      if (userLocal != null) {
        final uuid = userLocal.uid;
        final user = db.collection("users").doc(uuid);
        user.get().then(
          (DocumentSnapshot doc) async {
            final data =
                UserEntities.fromJson(doc.data() as Map<String, dynamic>);
            if (data.firstName == null) {
              Get.toNamed(AppRouters.signUpProcess);
            } else if (data.avatarUrl == null) {
              Get.toNamed(AppRouters.signUploadImage);
            } else if (data.address == null) {
              Get.toNamed(AppRouters.signUpSetLocation);
            } else if (data.isPhoneNumberVerified == false) {
              await sendCode(null)
                  .then((value) => Get.toNamed(AppRouters.signUpVerifyCode));
            } else {
              Get.offAllNamed(AppRouters.home);
            }
          },
          onError: (e) => print("Error getting document: $e"),
        );
      }
    } catch (e) {}
  }

  Future<void> signIn() async {
    try {
      EasyLoading.show(status: 'loading...');
      if (!validateFormSignIn()) {
        return;
      }
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      String? uuid = credential.user?.uid;
      if (uuid != null) {
        checkStepSignIn(credential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print(e.message);
    }
    EasyLoading.dismiss();
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

  TextEditingController getFirstNameEditingController() {
    return _firstNameController;
  }

  TextEditingController getLastNameEditingController() {
    return _lastNameController;
  }

  TextEditingController getPhoneNumberEditingController() {
    return _phoneNumberController;
  }

  TextEditingController getCodeVerifyEditingController() {
    return _codeVerify;
  }
}
