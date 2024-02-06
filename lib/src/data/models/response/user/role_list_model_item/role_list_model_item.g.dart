// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_list_model_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleListModelItemImpl _$$RoleListModelItemImplFromJson(
        Map<String, dynamic> json) =>
    _$RoleListModelItemImpl(
      id: json['id'] as int,
      naziv: json['naziv'] as String,
      vrijednostUAplikaciji: json['vrijednostUAplikaciji'] as int?,
    );

Map<String, dynamic> _$$RoleListModelItemImplToJson(
        _$RoleListModelItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'naziv': instance.naziv,
      'vrijednostUAplikaciji': instance.vrijednostUAplikaciji,
    };
