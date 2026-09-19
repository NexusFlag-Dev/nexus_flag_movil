
import 'package:nexus_flag_movil/core/type_defs.dart';
import 'package:nexus_flag_movil/features/auth/domain/repositories/auth_repository.dart';

import '../entities/auth_entity.dart';

class LoginWithGoogleUseCase extends UseCaseNoParams<AuthEntity> {
  LoginWithGoogleUseCase(this.authRepository);
  final AuthRepository authRepository;
  @override
  FutureEither<AuthEntity> call() {
    return authRepository.loginWithGoogle();
  }
}
