import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_list_model_item.freezed.dart';
part 'role_list_model_item.g.dart';

@freezed
class RoleListModelItem with _$RoleListModelItem {
  factory RoleListModelItem({
    required int id,
    required String naziv,
    int? vrijednostUAplikaciji,
  }) = _RoleListModelItem;

  factory RoleListModelItem.fromJson(Map<String, dynamic> json) =>
      _$RoleListModelItemFromJson(json);
}
