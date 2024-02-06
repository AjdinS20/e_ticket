// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_list_model_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoleListModelItem _$RoleListModelItemFromJson(Map<String, dynamic> json) {
  return _RoleListModelItem.fromJson(json);
}

/// @nodoc
mixin _$RoleListModelItem {
  int get id => throw _privateConstructorUsedError;
  String get naziv => throw _privateConstructorUsedError;
  int? get vrijednostUAplikaciji => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleListModelItemCopyWith<RoleListModelItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleListModelItemCopyWith<$Res> {
  factory $RoleListModelItemCopyWith(
          RoleListModelItem value, $Res Function(RoleListModelItem) then) =
      _$RoleListModelItemCopyWithImpl<$Res, RoleListModelItem>;
  @useResult
  $Res call({int id, String naziv, int? vrijednostUAplikaciji});
}

/// @nodoc
class _$RoleListModelItemCopyWithImpl<$Res, $Val extends RoleListModelItem>
    implements $RoleListModelItemCopyWith<$Res> {
  _$RoleListModelItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? naziv = null,
    Object? vrijednostUAplikaciji = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      naziv: null == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
              as String,
      vrijednostUAplikaciji: freezed == vrijednostUAplikaciji
          ? _value.vrijednostUAplikaciji
          : vrijednostUAplikaciji // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleListModelItemImplCopyWith<$Res>
    implements $RoleListModelItemCopyWith<$Res> {
  factory _$$RoleListModelItemImplCopyWith(_$RoleListModelItemImpl value,
          $Res Function(_$RoleListModelItemImpl) then) =
      __$$RoleListModelItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String naziv, int? vrijednostUAplikaciji});
}

/// @nodoc
class __$$RoleListModelItemImplCopyWithImpl<$Res>
    extends _$RoleListModelItemCopyWithImpl<$Res, _$RoleListModelItemImpl>
    implements _$$RoleListModelItemImplCopyWith<$Res> {
  __$$RoleListModelItemImplCopyWithImpl(_$RoleListModelItemImpl _value,
      $Res Function(_$RoleListModelItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? naziv = null,
    Object? vrijednostUAplikaciji = freezed,
  }) {
    return _then(_$RoleListModelItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      naziv: null == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
              as String,
      vrijednostUAplikaciji: freezed == vrijednostUAplikaciji
          ? _value.vrijednostUAplikaciji
          : vrijednostUAplikaciji // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleListModelItemImpl implements _RoleListModelItem {
  _$RoleListModelItemImpl(
      {required this.id, required this.naziv, this.vrijednostUAplikaciji});

  factory _$RoleListModelItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleListModelItemImplFromJson(json);

  @override
  final int id;
  @override
  final String naziv;
  @override
  final int? vrijednostUAplikaciji;

  @override
  String toString() {
    return 'RoleListModelItem(id: $id, naziv: $naziv, vrijednostUAplikaciji: $vrijednostUAplikaciji)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleListModelItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.naziv, naziv) || other.naziv == naziv) &&
            (identical(other.vrijednostUAplikaciji, vrijednostUAplikaciji) ||
                other.vrijednostUAplikaciji == vrijednostUAplikaciji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, naziv, vrijednostUAplikaciji);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleListModelItemImplCopyWith<_$RoleListModelItemImpl> get copyWith =>
      __$$RoleListModelItemImplCopyWithImpl<_$RoleListModelItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleListModelItemImplToJson(
      this,
    );
  }
}

abstract class _RoleListModelItem implements RoleListModelItem {
  factory _RoleListModelItem(
      {required final int id,
      required final String naziv,
      final int? vrijednostUAplikaciji}) = _$RoleListModelItemImpl;

  factory _RoleListModelItem.fromJson(Map<String, dynamic> json) =
      _$RoleListModelItemImpl.fromJson;

  @override
  int get id;
  @override
  String get naziv;
  @override
  int? get vrijednostUAplikaciji;
  @override
  @JsonKey(ignore: true)
  _$$RoleListModelItemImplCopyWith<_$RoleListModelItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
