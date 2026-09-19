import 'package:nexus_flag_movil/core/type_defs.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/auth_entity.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/registro_email_password.dart';

abstract class AuthRepository {
  FutureEither<AuthEntity> loginWithGoogle();
  FutureEither<AuthEntity> loginEmailPassword(String email, String password);
  FutureEither<AuthEntity> registroEmailPassword(RegistroParams registro);
  FutureEither<AuthEntity> getUsuarioLocal();
}