// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdentityTokenModel _$IdentityTokenModelFromJson(Map<String, dynamic> json) {
  return _IdentityTokenModel.fromJson(json);
}

/// @nodoc
mixin _$IdentityTokenModel {
  String get access_token => throw _privateConstructorUsedError;
  int get expires_in => throw _privateConstructorUsedError;
  String get refresh_token => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  String get token_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentityTokenModelCopyWith<IdentityTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityTokenModelCopyWith<$Res> {
  factory $IdentityTokenModelCopyWith(
          IdentityTokenModel value, $Res Function(IdentityTokenModel) then) =
      _$IdentityTokenModelCopyWithImpl<$Res, IdentityTokenModel>;
  @useResult
  $Res call(
      {String access_token,
      int expires_in,
      String refresh_token,
      String scope,
      String token_type});
}

/// @nodoc
class _$IdentityTokenModelCopyWithImpl<$Res, $Val extends IdentityTokenModel>
    implements $IdentityTokenModelCopyWith<$Res> {
  _$IdentityTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? expires_in = null,
    Object? refresh_token = null,
    Object? scope = null,
    Object? token_type = null,
  }) {
    return _then(_value.copyWith(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      expires_in: null == expires_in
          ? _value.expires_in
          : expires_in // ignore: cast_nullable_to_non_nullable
              as int,
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      token_type: null == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentityTokenModelImplCopyWith<$Res>
    implements $IdentityTokenModelCopyWith<$Res> {
  factory _$$IdentityTokenModelImplCopyWith(_$IdentityTokenModelImpl value,
          $Res Function(_$IdentityTokenModelImpl) then) =
      __$$IdentityTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String access_token,
      int expires_in,
      String refresh_token,
      String scope,
      String token_type});
}

/// @nodoc
class __$$IdentityTokenModelImplCopyWithImpl<$Res>
    extends _$IdentityTokenModelCopyWithImpl<$Res, _$IdentityTokenModelImpl>
    implements _$$IdentityTokenModelImplCopyWith<$Res> {
  __$$IdentityTokenModelImplCopyWithImpl(_$IdentityTokenModelImpl _value,
      $Res Function(_$IdentityTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? expires_in = null,
    Object? refresh_token = null,
    Object? scope = null,
    Object? token_type = null,
  }) {
    return _then(_$IdentityTokenModelImpl(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      expires_in: null == expires_in
          ? _value.expires_in
          : expires_in // ignore: cast_nullable_to_non_nullable
              as int,
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      token_type: null == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityTokenModelImpl implements _IdentityTokenModel {
  _$IdentityTokenModelImpl(
      {required this.access_token,
      required this.expires_in,
      required this.refresh_token,
      required this.scope,
      required this.token_type});

  factory _$IdentityTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityTokenModelImplFromJson(json);

  @override
  final String access_token;
  @override
  final int expires_in;
  @override
  final String refresh_token;
  @override
  final String scope;
  @override
  final String token_type;

  @override
  String toString() {
    return 'IdentityTokenModel(access_token: $access_token, expires_in: $expires_in, refresh_token: $refresh_token, scope: $scope, token_type: $token_type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityTokenModelImpl &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.expires_in, expires_in) ||
                other.expires_in == expires_in) &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.token_type, token_type) ||
                other.token_type == token_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, access_token, expires_in, refresh_token, scope, token_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityTokenModelImplCopyWith<_$IdentityTokenModelImpl> get copyWith =>
      __$$IdentityTokenModelImplCopyWithImpl<_$IdentityTokenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityTokenModelImplToJson(
      this,
    );
  }
}

abstract class _IdentityTokenModel implements IdentityTokenModel {
  factory _IdentityTokenModel(
      {required final String access_token,
      required final int expires_in,
      required final String refresh_token,
      required final String scope,
      required final String token_type}) = _$IdentityTokenModelImpl;

  factory _IdentityTokenModel.fromJson(Map<String, dynamic> json) =
      _$IdentityTokenModelImpl.fromJson;

  @override
  String get access_token;
  @override
  int get expires_in;
  @override
  String get refresh_token;
  @override
  String get scope;
  @override
  String get token_type;
  @override
  @JsonKey(ignore: true)
  _$$IdentityTokenModelImplCopyWith<_$IdentityTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
