import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_eye_password.g.dart';

@riverpod
class EyePasswordController extends _$EyePasswordController {
  @override
  bool build() => true;

  void handle() => state = !state;
}
