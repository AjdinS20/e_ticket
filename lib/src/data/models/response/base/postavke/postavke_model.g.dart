// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postavke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostavkeModelImpl _$$PostavkeModelImplFromJson(Map<String, dynamic> json) =>
    _$PostavkeModelImpl(
      naslovSistema: json['naslovSistema'] as String?,
      trajanjeSesije: json['trajanjeSesije'] as int,
      urlKarte: json['urlKarte'] as String?,
      autorskaPravaKarte: json['autorskaPravaKarte'] as String?,
      omogucenoKreiranjeRazredaUProsleGodine:
          json['omogucenoKreiranjeRazredaUProsleGodine'] as bool,
      retroaktivniUnosOcjenaSkola: json['retroaktivniUnosOcjenaSkola'] as bool,
      emailZaKarte: json['emailZaKarte'] as String?,
      sifraEmailaZaKarte: json['sifraEmailaZaKarte'] as String?,
      emailZaNotifikacije: json['emailZaNotifikacije'] as String?,
      sifraEmailaZaNotifikacije: json['sifraEmailaZaNotifikacije'] as String?,
      brojPokusaja: json['brojPokusaja'] as int?,
      brojDana: json['brojDana'] as int?,
      brojSatiMinuta: json['brojSatiMinuta'] as String?,
      defaultnaValuta: json['defaultnaValuta'] as String?,
      defaultCurrencyId: json['defaultCurrencyId'] as int?,
      defaultVatId: json['defaultVatId'] as int?,
      saljiFaktureWebService: json['saljiFaktureWebService'] as bool,
      saljiFaktureEmail: json['saljiFaktureEmail'] as bool,
      defaultStateId: json['defaultStateId'] as int?,
    );

Map<String, dynamic> _$$PostavkeModelImplToJson(_$PostavkeModelImpl instance) =>
    <String, dynamic>{
      'naslovSistema': instance.naslovSistema,
      'trajanjeSesije': instance.trajanjeSesije,
      'urlKarte': instance.urlKarte,
      'autorskaPravaKarte': instance.autorskaPravaKarte,
      'omogucenoKreiranjeRazredaUProsleGodine':
          instance.omogucenoKreiranjeRazredaUProsleGodine,
      'retroaktivniUnosOcjenaSkola': instance.retroaktivniUnosOcjenaSkola,
      'emailZaKarte': instance.emailZaKarte,
      'sifraEmailaZaKarte': instance.sifraEmailaZaKarte,
      'emailZaNotifikacije': instance.emailZaNotifikacije,
      'sifraEmailaZaNotifikacije': instance.sifraEmailaZaNotifikacije,
      'brojPokusaja': instance.brojPokusaja,
      'brojDana': instance.brojDana,
      'brojSatiMinuta': instance.brojSatiMinuta,
      'defaultnaValuta': instance.defaultnaValuta,
      'defaultCurrencyId': instance.defaultCurrencyId,
      'defaultVatId': instance.defaultVatId,
      'saljiFaktureWebService': instance.saljiFaktureWebService,
      'saljiFaktureEmail': instance.saljiFaktureEmail,
      'defaultStateId': instance.defaultStateId,
    };
