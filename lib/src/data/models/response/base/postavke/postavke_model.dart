import 'package:freezed_annotation/freezed_annotation.dart';

part 'postavke_model.freezed.dart';
part 'postavke_model.g.dart';

@freezed
class PostavkeModel with _$PostavkeModel {
  factory PostavkeModel({
    String? naslovSistema,
    required int trajanjeSesije,
    String? urlKarte,
    String? autorskaPravaKarte,
    required bool omogucenoKreiranjeRazredaUProsleGodine,
    required bool retroaktivniUnosOcjenaSkola,
    String? emailZaKarte,
    String? sifraEmailaZaKarte,
    String? emailZaNotifikacije,
    String? sifraEmailaZaNotifikacije,
    int? brojPokusaja,
    int? brojDana,
    String? brojSatiMinuta,
    String? defaultnaValuta,
    int? defaultCurrencyId,
    int? defaultVatId,
    required bool saljiFaktureWebService,
    required bool saljiFaktureEmail,
    int? defaultStateId,
  }) = _PostavkeModel;

  factory PostavkeModel.fromJson(Map<String, dynamic> json) =>
      _$PostavkeModelFromJson(json);
}
