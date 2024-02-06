// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sifarnik_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SifarnikModelImpl _$$SifarnikModelImplFromJson(Map<String, dynamic> json) =>
    _$SifarnikModelImpl(
      id: json['id'] as int,
      naziv: json['naziv'] as String?,
      sifra: json['sifra'] as String?,
      isDeleted: json['isDeleted'] as bool,
      poredak: json['poredak'] as int,
      prvi: json['prvi'] as bool,
      hex: json['hex'] as String?,
      datumIzmjene: json['datumIzmjene'] == null
          ? null
          : DateTime.parse(json['datumIzmjene'] as String),
    );

Map<String, dynamic> _$$SifarnikModelImplToJson(_$SifarnikModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'naziv': instance.naziv,
      'sifra': instance.sifra,
      'isDeleted': instance.isDeleted,
      'poredak': instance.poredak,
      'prvi': instance.prvi,
      'hex': instance.hex,
      'datumIzmjene': instance.datumIzmjene?.toIso8601String(),
    };
