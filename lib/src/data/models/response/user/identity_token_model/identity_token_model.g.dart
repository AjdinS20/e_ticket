// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityTokenModelImpl _$$IdentityTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IdentityTokenModelImpl(
      access_token: json['access_token'] as String,
      expires_in: json['expires_in'] as int,
      refresh_token: json['refresh_token'] as String,
      scope: json['scope'] as String,
      token_type: json['token_type'] as String,
    );

Map<String, dynamic> _$$IdentityTokenModelImplToJson(
        _$IdentityTokenModelImpl instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
      'refresh_token': instance.refresh_token,
      'scope': instance.scope,
      'token_type': instance.token_type,
    };
