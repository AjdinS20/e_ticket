// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sifarnik_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SifarnikModel _$SifarnikModelFromJson(Map<String, dynamic> json) {
  return _SifarnikModel.fromJson(json);
}

/// @nodoc
mixin _$SifarnikModel {
  int get id => throw _privateConstructorUsedError;
  String? get naziv => throw _privateConstructorUsedError;
  String? get sifra => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  int get poredak => throw _privateConstructorUsedError;
  bool get prvi => throw _privateConstructorUsedError;
  String? get hex => throw _privateConstructorUsedError;
  DateTime? get datumIzmjene => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SifarnikModelCopyWith<SifarnikModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SifarnikModelCopyWith<$Res> {
  factory $SifarnikModelCopyWith(
          SifarnikModel value, $Res Function(SifarnikModel) then) =
      _$SifarnikModelCopyWithImpl<$Res, SifarnikModel>;
  @useResult
  $Res call(
      {int id,
      String? naziv,
      String? sifra,
      bool isDeleted,
      int poredak,
      bool prvi,
      String? hex,
      DateTime? datumIzmjene});
}

/// @nodoc
class _$SifarnikModelCopyWithImpl<$Res, $Val extends SifarnikModel>
    implements $SifarnikModelCopyWith<$Res> {
  _$SifarnikModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? naziv = freezed,
    Object? sifra = freezed,
    Object? isDeleted = null,
    Object? poredak = null,
    Object? prvi = null,
    Object? hex = freezed,
    Object? datumIzmjene = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      naziv: freezed == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
              as String?,
      sifra: freezed == sifra
          ? _value.sifra
          : sifra // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      poredak: null == poredak
          ? _value.poredak
          : poredak // ignore: cast_nullable_to_non_nullable
              as int,
      prvi: null == prvi
          ? _value.prvi
          : prvi // ignore: cast_nullable_to_non_nullable
              as bool,
      hex: freezed == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String?,
      datumIzmjene: freezed == datumIzmjene
          ? _value.datumIzmjene
          : datumIzmjene // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SifarnikModelImplCopyWith<$Res>
    implements $SifarnikModelCopyWith<$Res> {
  factory _$$SifarnikModelImplCopyWith(
          _$SifarnikModelImpl value, $Res Function(_$SifarnikModelImpl) then) =
      __$$SifarnikModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? naziv,
      String? sifra,
      bool isDeleted,
      int poredak,
      bool prvi,
      String? hex,
      DateTime? datumIzmjene});
}

/// @nodoc
class __$$SifarnikModelImplCopyWithImpl<$Res>
    extends _$SifarnikModelCopyWithImpl<$Res, _$SifarnikModelImpl>
    implements _$$SifarnikModelImplCopyWith<$Res> {
  __$$SifarnikModelImplCopyWithImpl(
      _$SifarnikModelImpl _value, $Res Function(_$SifarnikModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? naziv = freezed,
    Object? sifra = freezed,
    Object? isDeleted = null,
    Object? poredak = null,
    Object? prvi = null,
    Object? hex = freezed,
    Object? datumIzmjene = freezed,
  }) {
    return _then(_$SifarnikModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      naziv: freezed == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
              as String?,
      sifra: freezed == sifra
          ? _value.sifra
          : sifra // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      poredak: null == poredak
          ? _value.poredak
          : poredak // ignore: cast_nullable_to_non_nullable
              as int,
      prvi: null == prvi
          ? _value.prvi
          : prvi // ignore: cast_nullable_to_non_nullable
              as bool,
      hex: freezed == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String?,
      datumIzmjene: freezed == datumIzmjene
          ? _value.datumIzmjene
          : datumIzmjene // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SifarnikModelImpl implements _SifarnikModel {
  _$SifarnikModelImpl(
      {required this.id,
      this.naziv,
      this.sifra,
      required this.isDeleted,
      required this.poredak,
      required this.prvi,
      this.hex,
      this.datumIzmjene});

  factory _$SifarnikModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SifarnikModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? naziv;
  @override
  final String? sifra;
  @override
  final bool isDeleted;
  @override
  final int poredak;
  @override
  final bool prvi;
  @override
  final String? hex;
  @override
  final DateTime? datumIzmjene;

  @override
  String toString() {
    return 'SifarnikModel(id: $id, naziv: $naziv, sifra: $sifra, isDeleted: $isDeleted, poredak: $poredak, prvi: $prvi, hex: $hex, datumIzmjene: $datumIzmjene)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SifarnikModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.naziv, naziv) || other.naziv == naziv) &&
            (identical(other.sifra, sifra) || other.sifra == sifra) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.poredak, poredak) || other.poredak == poredak) &&
            (identical(other.prvi, prvi) || other.prvi == prvi) &&
            (identical(other.hex, hex) || other.hex == hex) &&
            (identical(other.datumIzmjene, datumIzmjene) ||
                other.datumIzmjene == datumIzmjene));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, naziv, sifra, isDeleted,
      poredak, prvi, hex, datumIzmjene);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SifarnikModelImplCopyWith<_$SifarnikModelImpl> get copyWith =>
      __$$SifarnikModelImplCopyWithImpl<_$SifarnikModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SifarnikModelImplToJson(
      this,
    );
  }
}

abstract class _SifarnikModel implements SifarnikModel {
  factory _SifarnikModel(
      {required final int id,
      final String? naziv,
      final String? sifra,
      required final bool isDeleted,
      required final int poredak,
      required final bool prvi,
      final String? hex,
      final DateTime? datumIzmjene}) = _$SifarnikModelImpl;

  factory _SifarnikModel.fromJson(Map<String, dynamic> json) =
      _$SifarnikModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get naziv;
  @override
  String? get sifra;
  @override
  bool get isDeleted;
  @override
  int get poredak;
  @override
  bool get prvi;
  @override
  String? get hex;
  @override
  DateTime? get datumIzmjene;
  @override
  @JsonKey(ignore: true)
  _$$SifarnikModelImplCopyWith<_$SifarnikModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
