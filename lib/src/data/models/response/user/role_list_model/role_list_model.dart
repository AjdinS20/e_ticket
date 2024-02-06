import 'package:freezed_annotation/freezed_annotation.dart';

import '../role_list_model_item/role_list_model_item.dart';

part 'role_list_model.freezed.dart';
part 'role_list_model.g.dart';

@freezed
class RoleListModel with _$RoleListModel {
  factory RoleListModel({
    required List<RoleListModelItem> items,
  }) = _RoleListModel;

  factory RoleListModel.fromJson(Map<String, dynamic> json) =>
      _$RoleListModelFromJson(json);
}
