// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntities _$UserEntitiesFromJson(Map<String, dynamic> json) {
  return _UserEntities.fromJson(json);
}

/// @nodoc
mixin _$UserEntities {
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  int? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_me')
  bool? get emailMe => throw _privateConstructorUsedError;
  @JsonKey(name: 'keep_me_sign_in')
  bool? get keep_me_sign_in => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntitiesCopyWith<UserEntities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntitiesCopyWith<$Res> {
  factory $UserEntitiesCopyWith(
          UserEntities value, $Res Function(UserEntities) then) =
      _$UserEntitiesCopyWithImpl<$Res, UserEntities>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? uuid,
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
      @JsonKey(name: 'keep_me_sign_in') bool? keep_me_sign_in});
}

/// @nodoc
class _$UserEntitiesCopyWithImpl<$Res, $Val extends UserEntities>
    implements $UserEntitiesCopyWith<$Res> {
  _$UserEntitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? isActive = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatarUrl = freezed,
    Object? phoneNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? emailMe = freezed,
    Object? keep_me_sign_in = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      emailMe: freezed == emailMe
          ? _value.emailMe
          : emailMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      keep_me_sign_in: freezed == keep_me_sign_in
          ? _value.keep_me_sign_in
          : keep_me_sign_in // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntitiesImplCopyWith<$Res>
    implements $UserEntitiesCopyWith<$Res> {
  factory _$$UserEntitiesImplCopyWith(
          _$UserEntitiesImpl value, $Res Function(_$UserEntitiesImpl) then) =
      __$$UserEntitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? uuid,
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
      @JsonKey(name: 'keep_me_sign_in') bool? keep_me_sign_in});
}

/// @nodoc
class __$$UserEntitiesImplCopyWithImpl<$Res>
    extends _$UserEntitiesCopyWithImpl<$Res, _$UserEntitiesImpl>
    implements _$$UserEntitiesImplCopyWith<$Res> {
  __$$UserEntitiesImplCopyWithImpl(
      _$UserEntitiesImpl _value, $Res Function(_$UserEntitiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? isActive = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatarUrl = freezed,
    Object? phoneNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? emailMe = freezed,
    Object? keep_me_sign_in = freezed,
  }) {
    return _then(_$UserEntitiesImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      emailMe: freezed == emailMe
          ? _value.emailMe
          : emailMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      keep_me_sign_in: freezed == keep_me_sign_in
          ? _value.keep_me_sign_in
          : keep_me_sign_in // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntitiesImpl implements _UserEntities {
  const _$UserEntitiesImpl(
      {@JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'email_me') this.emailMe,
      @JsonKey(name: 'keep_me_sign_in') this.keep_me_sign_in});

  factory _$UserEntitiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntitiesImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'created_at')
  final int? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final int? deletedAt;
  @override
  @JsonKey(name: 'email_me')
  final bool? emailMe;
  @override
  @JsonKey(name: 'keep_me_sign_in')
  final bool? keep_me_sign_in;

  @override
  String toString() {
    return 'UserEntities(uuid: $uuid, email: $email, username: $username, isActive: $isActive, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, emailMe: $emailMe, keep_me_sign_in: $keep_me_sign_in)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntitiesImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.emailMe, emailMe) || other.emailMe == emailMe) &&
            (identical(other.keep_me_sign_in, keep_me_sign_in) ||
                other.keep_me_sign_in == keep_me_sign_in));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      email,
      username,
      isActive,
      firstName,
      lastName,
      avatarUrl,
      phoneNumber,
      createdAt,
      updatedAt,
      deletedAt,
      emailMe,
      keep_me_sign_in);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntitiesImplCopyWith<_$UserEntitiesImpl> get copyWith =>
      __$$UserEntitiesImplCopyWithImpl<_$UserEntitiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntitiesImplToJson(
      this,
    );
  }
}

abstract class _UserEntities implements UserEntities {
  const factory _UserEntities(
          {@JsonKey(name: 'uuid') final String? uuid,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'phone_number') final String? phoneNumber,
          @JsonKey(name: 'created_at') final int? createdAt,
          @JsonKey(name: 'updated_at') final int? updatedAt,
          @JsonKey(name: 'deleted_at') final int? deletedAt,
          @JsonKey(name: 'email_me') final bool? emailMe,
          @JsonKey(name: 'keep_me_sign_in') final bool? keep_me_sign_in}) =
      _$UserEntitiesImpl;

  factory _UserEntities.fromJson(Map<String, dynamic> json) =
      _$UserEntitiesImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'created_at')
  int? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  int? get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  int? get deletedAt;
  @override
  @JsonKey(name: 'email_me')
  bool? get emailMe;
  @override
  @JsonKey(name: 'keep_me_sign_in')
  bool? get keep_me_sign_in;
  @override
  @JsonKey(ignore: true)
  _$$UserEntitiesImplCopyWith<_$UserEntitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
