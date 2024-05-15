import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_count_down.g.dart';

@riverpod
class CountDown extends _$CountDown {
  @override
  int? build() => null;

  void setTimer(int time) => state = time;
}
