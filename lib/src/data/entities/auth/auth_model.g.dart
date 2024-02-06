// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      userName: json['userName'] as String,
      dozvoljeneAkcije: (json['dozvoljeneAkcije'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      email: json['email'] as String,
      frontendModul: json['frontendModul'] as String,
      frontendModulNaslov: json['frontendModulNaslov'] as String,
      punoIme: json['punoIme'] as String,
      role: json['role'] as String,
      ulogaId: json['ulogaId'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'dozvoljeneAkcije': instance.dozvoljeneAkcije,
      'email': instance.email,
      'frontendModul': instance.frontendModul,
      'frontendModulNaslov': instance.frontendModulNaslov,
      'punoIme': instance.punoIme,
      'role': instance.role,
      'ulogaId': instance.ulogaId,
      'token': instance.token,
    };
