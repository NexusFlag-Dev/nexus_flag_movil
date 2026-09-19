import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/core/providers/repository_provider.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/login_email_password_usecase.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/login_local_usecase.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/login_with_google_usecase.dart';
import 'package:nexus_flag_movil/features/auth/domain/usecase/registro_email_password.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecases.g.dart';

@riverpod
LoginWithGoogleUseCase loginWithGoogleUseCase(Ref ref) =>
    LoginWithGoogleUseCase(ref.read(authRepositoryProvider));

@riverpod
LoginEmailPasswordUseCase loginEmailPasswordUseCase(Ref ref) =>
    LoginEmailPasswordUseCase(ref.read(authRepositoryProvider));

@riverpod
RegistroEmailPassword registroEmailPassword(Ref ref) =>
    RegistroEmailPassword(ref.read(authRepositoryProvider));

@riverpod
LoginLocalUsecase loginLocalUsecase(Ref ref) =>
    LoginLocalUsecase(ref.read(authRepositoryProvider));