import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  factory UserInfoModel({
    required String dodatneInformacije,
    required List<String> dozvoljeneAkcije,
    required String email,
    required bool email_verified,
    required String frontendModul,
    required String frontendModulNaslov,
    required String name,
    required String preferred_username,
    required String punoIme,
    required String role,
    required String sub,
    required String ulogaId,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
