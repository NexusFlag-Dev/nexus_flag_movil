import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_dto.freezed.dart';
part 'tokens_dto.g.dart';

@freezed
abstract class TokensDTO with _$TokensDTO {
  const factory TokensDTO({
    @JsonKey(name: 'refresh') required String refresh,
    @JsonKey(name: 'access') required String access,
  }) = _TokensDTO;

  factory TokensDTO.fromJson(Map<String, dynamic> json) =>
      _$TokensDTOFromJson(json);
}