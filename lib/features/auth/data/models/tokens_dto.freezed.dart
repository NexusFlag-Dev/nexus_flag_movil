// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokensDTO {

@JsonKey(name: 'refresh') String get refresh;@JsonKey(name: 'access') String get access;
/// Create a copy of TokensDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokensDTOCopyWith<TokensDTO> get copyWith => _$TokensDTOCopyWithImpl<TokensDTO>(this as TokensDTO, _$identity);

  /// Serializes this TokensDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokensDTO&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refresh,access);

@override
String toString() {
  return 'TokensDTO(refresh: $refresh, access: $access)';
}


}

/// @nodoc
abstract mixin class $TokensDTOCopyWith<$Res>  {
  factory $TokensDTOCopyWith(TokensDTO value, $Res Function(TokensDTO) _then) = _$TokensDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'refresh') String refresh,@JsonKey(name: 'access') String access
});




}
/// @nodoc
class _$TokensDTOCopyWithImpl<$Res>
    implements $TokensDTOCopyWith<$Res> {
  _$TokensDTOCopyWithImpl(this._self, this._then);

  final TokensDTO _self;
  final $Res Function(TokensDTO) _then;

/// Create a copy of TokensDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refresh = null,Object? access = null,}) {
  return _then(_self.copyWith(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TokensDTO implements TokensDTO {
  const _TokensDTO({@JsonKey(name: 'refresh') required this.refresh, @JsonKey(name: 'access') required this.access});
  factory _TokensDTO.fromJson(Map<String, dynamic> json) => _$TokensDTOFromJson(json);

@override@JsonKey(name: 'refresh') final  String refresh;
@override@JsonKey(name: 'access') final  String access;

/// Create a copy of TokensDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokensDTOCopyWith<_TokensDTO> get copyWith => __$TokensDTOCopyWithImpl<_TokensDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokensDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokensDTO&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refresh,access);

@override
String toString() {
  return 'TokensDTO(refresh: $refresh, access: $access)';
}


}

/// @nodoc
abstract mixin class _$TokensDTOCopyWith<$Res> implements $TokensDTOCopyWith<$Res> {
  factory _$TokensDTOCopyWith(_TokensDTO value, $Res Function(_TokensDTO) _then) = __$TokensDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'refresh') String refresh,@JsonKey(name: 'access') String access
});




}
/// @nodoc
class __$TokensDTOCopyWithImpl<$Res>
    implements _$TokensDTOCopyWith<$Res> {
  __$TokensDTOCopyWithImpl(this._self, this._then);

  final _TokensDTO _self;
  final $Res Function(_TokensDTO) _then;

/// Create a copy of TokensDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refresh = null,Object? access = null,}) {
  return _then(_TokensDTO(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
