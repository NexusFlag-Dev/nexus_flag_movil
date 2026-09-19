
import 'package:nexus_flag_movil/features/auth/domain/entities/user_entity.dart';

class AuthEntity {
  AuthEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken
  });
  final UserEntity user;
  final String accessToken;
  final String refreshToken;
}