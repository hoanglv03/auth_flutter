// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntitiesImpl _$$UserEntitiesImplFromJson(Map<String, dynamic> json) =>
    _$UserEntitiesImpl(
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      isActive: json['is_active'] as bool?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      deletedAt: (json['deleted_at'] as num?)?.toInt(),
      emailMe: json['email_me'] as bool?,
      keep_me_sign_in: json['keep_me_sign_in'] as bool?,
      method_sign_in: json['method_sign_in'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$UserEntitiesImplToJson(_$UserEntitiesImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'username': instance.username,
      'is_active': instance.isActive,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'email_me': instance.emailMe,
      'keep_me_sign_in': instance.keep_me_sign_in,
      'method_sign_in': instance.method_sign_in,
      'address': instance.address,
    };
