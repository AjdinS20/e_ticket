import 'package:freezed_annotation/freezed_annotation.dart';

part 'sifarnik_model.freezed.dart';
part 'sifarnik_model.g.dart';

@freezed
class SifarnikModel with _$SifarnikModel {
  factory SifarnikModel({
    required int id,
    String? naziv,
    String? sifra,
    required bool isDeleted,
    required int poredak,
    required bool prvi,
    String? hex,
    DateTime? datumIzmjene,
  }) = _SifarnikModel;

  factory SifarnikModel.fromJson(Map<String, dynamic> json) =>
      _$SifarnikModelFromJson(json);
}
