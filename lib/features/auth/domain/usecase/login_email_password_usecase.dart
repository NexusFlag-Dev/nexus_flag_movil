import 'package:nexus_flag_movil/core/type_defs.dart';
import 'package:nexus_flag_movil/core/usecases/usecase.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/auth_entity.dart';

import '../repositories/auth_repository.dart';

class LoginEmailPasswordUseCase extends UseCase<AuthEntity, LoginParams> {
  LoginEmailPasswordUseCase(this.authRepository);
  final AuthRepository authRepository;

  @override
  FutureEither<AuthEntity> call(LoginParams params) async {
    return authRepository.loginEmailPassword(params.email, params.password);
  }

}

class LoginParams {
  final String email;
  final String password;
  const LoginParams({
    required this.email,
    required this.password
  });
}