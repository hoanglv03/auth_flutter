import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entities.freezed.dart';
part 'user_entities.g.dart';

@freezed
class UserEntities with _$UserEntities {
  const factory UserEntities({
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'email') String? email,
  }) = _UserEntities;

  factory UserEntities.fromJson(Map<String, dynamic> json) =>
      _$UserEntitiesFromJson(json);
}
