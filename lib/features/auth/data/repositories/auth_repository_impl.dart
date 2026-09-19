import 'package:nexus_flag_movil/core/auth/auth_service.dart';
import 'package:nexus_flag_movil/core/auth/storage/User_storage.dart';
import 'package:nexus_flag_movil/features/auth/data/datasources/local/user_auth_dao.dart';
import 'package:nexus_flag_movil/features/auth/data/datasources/remote/auth_api_service.dart';
import 'package:nexus_flag_movil/features/auth/data/mappers/auth_mapper.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/auth_entity.dart';
import 'package:nexus_flag_movil/features/auth/domain/repositories/auth_repository.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/registro_email_password.dart';

import '../../../../core/error/exception_handler.dart';
import '../../../../core/type_defs.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authApiService, this._authService, this._userStorage, this._userAuthDAO);
  final AuthApiService _authApiService;
  final AuthService _authService;
  final UserStorage _userStorage;
  final UserAuthDAO _userAuthDAO;
  @override
  FutureEither<AuthEntity> loginWithGoogle() async {

    return ExceptionHandler.handleRemote(() async {
      final firebaseToken = await _authService.signInWithGoogleFirebase();

      if (firebaseToken == null) {
        throw Exception('No se pudo obtener el token de Google.');
      }
      
      final user = await _authApiService.login({
        "firebase_token" : firebaseToken,
      });

      _userStorage.saveSession(access: user.tokens.access, refresh: user.tokens.refresh);

      final userEntity = user.toEntity();

      _userAuthDAO.saveUserAuth(userEntity.user);

      return userEntity;
    });
  }

  @override
  FutureEither<AuthEntity> loginEmailPassword(String email, String password) async{
    return ExceptionHandler.handleRemote(() async {
      final firebaseToken = await _authService.signInWithEmailAndPassword(
          email: email, password: password
      );

      if (firebaseToken == null) {
        throw Exception('No se pudo obtener el token de Google.');
      }

      final user = await _authApiService.login({
        "firebase_token" : firebaseToken,
      });
      return user.toEntity();
    },);
  }

  @override
  FutureEither<AuthEntity> registroEmailPassword(RegistroParams registro) async {
    return ExceptionHandler.handleRemote(() async {
      final firebaseToken = await _authService.registerWithEmailAndPassword(
          email: registro.email, password: registro.password
      );
      if (firebaseToken == null) {
        throw Exception('No se pudo obtener el token de Google.');
      }

      //todo Falta agregar los demas campos al backend / agregar un endpoint que solicite token con los demas campos
      //agregar que en caso de que no se guarde el usuario en posgre se elimine el usuario en firebase.
      final user = await _authApiService.login({
        "firebase_token" : firebaseToken,
      });
      return user.toEntity();
    },);
  }

  @override
  FutureEither<AuthEntity> getUsuarioLocal() {
    return ExceptionHandler.handleLocal(() async {
      final user = await _userAuthDAO.getUserAuth();
      final accessToken = await _userStorage.getAccessToken();
      final refreshToken = await _userStorage.getRefreshToken();

      if(user == null || accessToken == null || refreshToken == null){
        await _userStorage.clearSession();
        await _userAuthDAO.deleteUserAuth();
        throw Exception('No hay sesión almacenada.');
      }

      return AuthEntity(user: user, accessToken: accessToken, refreshToken: refreshToken);
    },);

  }



}