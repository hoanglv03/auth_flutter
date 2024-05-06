import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_email_me.g.dart';

@riverpod
class EmailMeController extends _$EmailMeController {
  @override
  bool build() => false;

  void handle() => state = !state;
}
