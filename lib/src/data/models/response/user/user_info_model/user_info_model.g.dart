// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      dodatneInformacije: json['dodatneInformacije'] as String,
      dozvoljeneAkcije: (json['dozvoljeneAkcije'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      email: json['email'] as String,
      email_verified: json['email_verified'] as bool,
      frontendModul: json['frontendModul'] as String,
      frontendModulNaslov: json['frontendModulNaslov'] as String,
      name: json['name'] as String,
      preferred_username: json['preferred_username'] as String,
      punoIme: json['punoIme'] as String,
      role: json['role'] as String,
      sub: json['sub'] as String,
      ulogaId: json['ulogaId'] as String,
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'dodatneInformacije': instance.dodatneInformacije,
      'dozvoljeneAkcije': instance.dozvoljeneAkcije,
      'email': instance.email,
      'email_verified': instance.email_verified,
      'frontendModul': instance.frontendModul,
      'frontendModulNaslov': instance.frontendModulNaslov,
      'name': instance.name,
      'preferred_username': instance.preferred_username,
      'punoIme': instance.punoIme,
      'role': instance.role,
      'sub': instance.sub,
      'ulogaId': instance.ulogaId,
    };
