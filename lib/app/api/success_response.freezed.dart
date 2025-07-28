// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'success_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuccessResponse {

 String? get message; num? get returnCode;
/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessResponseCopyWith<SuccessResponse> get copyWith => _$SuccessResponseCopyWithImpl<SuccessResponse>(this as SuccessResponse, _$identity);

  /// Serializes this SuccessResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.returnCode, returnCode) || other.returnCode == returnCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,returnCode);

@override
String toString() {
  return 'SuccessResponse(message: $message, returnCode: $returnCode)';
}


}

/// @nodoc
abstract mixin class $SuccessResponseCopyWith<$Res>  {
  factory $SuccessResponseCopyWith(SuccessResponse value, $Res Function(SuccessResponse) _then) = _$SuccessResponseCopyWithImpl;
@useResult
$Res call({
 String? message, num? returnCode
});




}
/// @nodoc
class _$SuccessResponseCopyWithImpl<$Res>
    implements $SuccessResponseCopyWith<$Res> {
  _$SuccessResponseCopyWithImpl(this._self, this._then);

  final SuccessResponse _self;
  final $Res Function(SuccessResponse) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? returnCode = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,returnCode: freezed == returnCode ? _self.returnCode : returnCode // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SuccessResponse implements SuccessResponse {
  const _SuccessResponse({this.message, this.returnCode});
  factory _SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);

@override final  String? message;
@override final  num? returnCode;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessResponseCopyWith<_SuccessResponse> get copyWith => __$SuccessResponseCopyWithImpl<_SuccessResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuccessResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.returnCode, returnCode) || other.returnCode == returnCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,returnCode);

@override
String toString() {
  return 'SuccessResponse(message: $message, returnCode: $returnCode)';
}


}

/// @nodoc
abstract mixin class _$SuccessResponseCopyWith<$Res> implements $SuccessResponseCopyWith<$Res> {
  factory _$SuccessResponseCopyWith(_SuccessResponse value, $Res Function(_SuccessResponse) _then) = __$SuccessResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message, num? returnCode
});




}
/// @nodoc
class __$SuccessResponseCopyWithImpl<$Res>
    implements _$SuccessResponseCopyWith<$Res> {
  __$SuccessResponseCopyWithImpl(this._self, this._then);

  final _SuccessResponse _self;
  final $Res Function(_SuccessResponse) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? returnCode = freezed,}) {
  return _then(_SuccessResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,returnCode: freezed == returnCode ? _self.returnCode : returnCode // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}

// dart format on
