import 'package:nexus_flag_movil/core/type_defs.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/auth_entity.dart';

import '../repositories/auth_repository.dart';

class LoginLocalUsecase extends UseCaseNoParams<AuthEntity> {
  LoginLocalUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  FutureEither<AuthEntity> call() async {
    return authRepository.getUsuarioLocal();
  }
}