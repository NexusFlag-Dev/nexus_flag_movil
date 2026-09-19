import 'package:nexus_flag_movil/core/type_defs.dart';
import 'package:nexus_flag_movil/core/usecases/usecase.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class RegistroEmailPassword extends UseCase<AuthEntity, RegistroParams> {
  RegistroEmailPassword(this.authRepository);
  final AuthRepository authRepository;
  @override
  FutureEither<AuthEntity> call(RegistroParams params) async {
    return authRepository.registroEmailPassword(params);
  }

}


class RegistroParams {
  final String nombre;
  final String apellido;

  final String email;
  final String password;

  const RegistroParams({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.password,
  });
}