import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entities.freezed.dart';
part 'user_entities.g.dart';

@freezed
class UserEntities with _$UserEntities {
  const factory UserEntities({
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
    @JsonKey(name: 'deleted_at') int? deletedAt,
    @JsonKey(name: 'email_me') bool? emailMe,
    @JsonKey(name: 'keep_me_sign_in') bool? keep_me_sign_in,
  }) = _UserEntities;

  factory UserEntities.fromJson(Map<String, dynamic> json) =>
      _$UserEntitiesFromJson(json);
}
