// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    _SuccessResponse(
      message: json['message'] as String?,
      returnCode: json['returnCode'] as num?,
    );

Map<String, dynamic> _$SuccessResponseToJson(_SuccessResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'returnCode': instance.returnCode,
    };
