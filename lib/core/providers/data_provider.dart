import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/core/auth/storage/User_storage.dart';
import 'package:nexus_flag_movil/core/local_storage/objectbox_service.dart';
import 'package:nexus_flag_movil/core/providers/config_provider.dart';
import 'package:nexus_flag_movil/features/auth/data/datasources/local/user_auth_dao.dart';
import 'package:nexus_flag_movil/features/auth/data/datasources/local/user_auth_user_dao_obx_impl.dart';
import 'package:nexus_flag_movil/features/auth/data/datasources/remote/auth_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_provider.g.dart';

@riverpod
AuthApiService authApiService(Ref ref) =>
    AuthApiService(ref.read(dioClientProvider));

@riverpod
UserStorage userStorage(Ref ref) =>
    UserStorage();

@riverpod
UserAuthDAO userAuthDAO(Ref ref) =>
    UserAuthUserImplOB(ref.read(objectBoxServiceProvider).userAuthBox);
