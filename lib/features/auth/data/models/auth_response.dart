import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_dto.dart';
import 'tokens_dto.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'user') required UserDTO user,
    @JsonKey(name: 'tokens') required TokensDTO tokens,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}