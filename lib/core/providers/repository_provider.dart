import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/core/auth/auth_provider.dart';
import 'package:nexus_flag_movil/core/providers/data_provider.dart';
import 'package:nexus_flag_movil/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nexus_flag_movil/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
    AuthRepositoryImpl(ref.read(authApiServiceProvider), 
        ref.read(authServiceProvider),
    ref.read(userStorageProvider),
    ref.read(userAuthDAOProvider));
