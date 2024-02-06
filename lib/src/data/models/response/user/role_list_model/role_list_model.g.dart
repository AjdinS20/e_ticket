// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleListModelImpl _$$RoleListModelImplFromJson(Map<String, dynamic> json) =>
    _$RoleListModelImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => RoleListModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RoleListModelImplToJson(_$RoleListModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
