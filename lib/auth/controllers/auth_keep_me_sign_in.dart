import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_keep_me_sign_in.g.dart';

@riverpod
class KeepMeSignInController extends _$KeepMeSignInController {
  @override
  bool build() => false;

  void handle() => state = !state;
}
