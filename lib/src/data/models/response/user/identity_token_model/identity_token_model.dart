import 'package:freezed_annotation/freezed_annotation.dart';

part 'identity_token_model.freezed.dart';
part 'identity_token_model.g.dart';

@freezed
class IdentityTokenModel with _$IdentityTokenModel {
  factory IdentityTokenModel({
    required String access_token,
    required int expires_in,
    required String refresh_token,
    required String scope,
    required String token_type,
  }) = _IdentityTokenModel;

  factory IdentityTokenModel.fromJson(Map<String, dynamic> json) =>
      _$IdentityTokenModelFromJson(json);
}
