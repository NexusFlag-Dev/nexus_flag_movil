import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) String? refresh,
    @Default(null) String? access,
    @Default(null) int? id,
    @Default(null) String? email,
    @Default(null) String? firstName,
    @Default(null) String? lastName,
    @Default(null) String? role,
    @Default(null) String? photo,
    @Default(null) String? firebaseUid,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
  }) = _AuthState;

}