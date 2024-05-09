import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_avatar_url.g.dart';

@riverpod
class UpdateAvatarUrl extends _$UpdateAvatarUrl {
  @override
  String? build() => null;

  void updateUrl(String url) => state = url;
  void removeAvatarImage() => state = null;
}
