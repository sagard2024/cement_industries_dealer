import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

@freezed
abstract class SuccessResponse with _$SuccessResponse {
  const factory SuccessResponse({
    String? message,
    num? returnCode,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);
}
