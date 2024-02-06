import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    required String userName,
    required List<String> dozvoljeneAkcije,
    required String email,
    required String frontendModul,
    required String frontendModulNaslov,
    required String punoIme,
    required String role,
    required String ulogaId,
    required String token,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
