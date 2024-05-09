import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_set_location.g.dart';

@riverpod
class SetLocation extends _$SetLocation {
  @override
  String? build() => null;

  void setLocation(String address) => state = address;
}
