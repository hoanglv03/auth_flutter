import 'package:auth_flutter_with_firebase/auth/sign_in/sign_in_state.dart';
import 'package:auth_flutter_with_firebase/pages/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpLogic extends GetxController {
  final state = SignUpState();

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
        state.socialAccount.value = value;
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
      if (value.user?.email != null) {
        Get.to(() => HomeView());
        state.socialAccount.value = value;
      }
      return value;
    });
  }
}
