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
      @JsonKey(name: 'email') String? email});
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
      @JsonKey(name: 'email') String? email});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntitiesImpl implements _UserEntities {
  const _$UserEntitiesImpl(
      {@JsonKey(name: 'uuid') this.uuid, @JsonKey(name: 'email') this.email});

  factory _$UserEntitiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntitiesImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  String toString() {
    return 'UserEntities(uuid: $uuid, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntitiesImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, email);

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
      @JsonKey(name: 'email') final String? email}) = _$UserEntitiesImpl;

  factory _UserEntities.fromJson(Map<String, dynamic> json) =
      _$UserEntitiesImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UserEntitiesImplCopyWith<_$UserEntitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
