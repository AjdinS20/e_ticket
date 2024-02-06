// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoleListModel _$RoleListModelFromJson(Map<String, dynamic> json) {
  return _RoleListModel.fromJson(json);
}

/// @nodoc
mixin _$RoleListModel {
  List<RoleListModelItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleListModelCopyWith<RoleListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleListModelCopyWith<$Res> {
  factory $RoleListModelCopyWith(
          RoleListModel value, $Res Function(RoleListModel) then) =
      _$RoleListModelCopyWithImpl<$Res, RoleListModel>;
  @useResult
  $Res call({List<RoleListModelItem> items});
}

/// @nodoc
class _$RoleListModelCopyWithImpl<$Res, $Val extends RoleListModel>
    implements $RoleListModelCopyWith<$Res> {
  _$RoleListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RoleListModelItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleListModelImplCopyWith<$Res>
    implements $RoleListModelCopyWith<$Res> {
  factory _$$RoleListModelImplCopyWith(
          _$RoleListModelImpl value, $Res Function(_$RoleListModelImpl) then) =
      __$$RoleListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoleListModelItem> items});
}

/// @nodoc
class __$$RoleListModelImplCopyWithImpl<$Res>
    extends _$RoleListModelCopyWithImpl<$Res, _$RoleListModelImpl>
    implements _$$RoleListModelImplCopyWith<$Res> {
  __$$RoleListModelImplCopyWithImpl(
      _$RoleListModelImpl _value, $Res Function(_$RoleListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$RoleListModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RoleListModelItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleListModelImpl implements _RoleListModel {
  _$RoleListModelImpl({required final List<RoleListModelItem> items})
      : _items = items;

  factory _$RoleListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleListModelImplFromJson(json);

  final List<RoleListModelItem> _items;
  @override
  List<RoleListModelItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'RoleListModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleListModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleListModelImplCopyWith<_$RoleListModelImpl> get copyWith =>
      __$$RoleListModelImplCopyWithImpl<_$RoleListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleListModelImplToJson(
      this,
    );
  }
}

abstract class _RoleListModel implements RoleListModel {
  factory _RoleListModel({required final List<RoleListModelItem> items}) =
      _$RoleListModelImpl;

  factory _RoleListModel.fromJson(Map<String, dynamic> json) =
      _$RoleListModelImpl.fromJson;

  @override
  List<RoleListModelItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$RoleListModelImplCopyWith<_$RoleListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
