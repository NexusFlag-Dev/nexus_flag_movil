import 'package:fpdart/fpdart.dart';
import 'package:nexus_flag_movil/core/auth/auth_provider.dart';
import 'package:nexus_flag_movil/core/providers/usecase/auth/auth_usecases.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/login_email_password_usecase.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/registro_email_password.dart';
import 'package:nexus_flag_movil/features/auth/presentation/manager/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/auth_entity.dart';

part 'login_vm.g.dart';

@Riverpod(keepAlive: true)
class LoginVM extends _$LoginVM {

  @override
  AuthState build(){
    return AuthState();
  }

  void _handleAuthResult(Either<Failure, AuthEntity> result) {
    result.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
          (authEntity) {
        state = state.copyWith(
          refresh: authEntity.refreshToken,
          access: authEntity.accessToken,
          id: authEntity.user.id,
          email: authEntity.user.email,
          firstName: authEntity.user.firstName,
          lastName: authEntity.user.lastName,
          role: authEntity.user.role,
          photo: authEntity.user.photo,
          firebaseUid: authEntity.user.firebaseUid,
          isLoading: false,
          errorMessage: null,
        );
      },
    );
  }

  Future<void> _executeAuthOperation(Future<Either<Failure, AuthEntity>> Function() operation) async {
    state = state.copyWith(
        isLoading: true,
        errorMessage: null
    );

    final result = await operation();
    _handleAuthResult(result);
  }

  Future<void> loginWithGoogle() async {
    await _executeAuthOperation(() async {
      final loginWithGoogle = ref.read(loginWithGoogleUseCaseProvider);
      return await loginWithGoogle.call();
    });
  }

  Future<void> loginEmailPassword(String email, String password) async {
    await _executeAuthOperation(() async {
      final loginEmailPassword = ref.read(loginEmailPasswordUseCaseProvider);
      return await loginEmailPassword.call(
          LoginParams(email: email, password: password)
      );
    });
  }

  Future<void> registrarUsuario(String nombre, String apellido, String email, String password) async {
    await _executeAuthOperation(() async {
      final registroEmailPassword = ref.read(registroEmailPasswordProvider);
      return await registroEmailPassword.call(
          RegistroParams(
              nombre: nombre,
              apellido: apellido,
              email: email,
              password: password
          )
      );
    });
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();

      state = AuthState();
    } catch (e) {
      state = AuthState(errorMessage: 'Error al cerrar sesión: $e');
      state = AuthState();
    }
  }
}