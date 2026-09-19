
import 'package:nexus_flag_movil/features/auth/domain/entities/user_entity.dart';

abstract class UserAuthDAO {
  Future saveUserAuth(UserEntity userAuth);
  Future deleteUserAuth();
  Future<UserEntity?> getUserAuth();
}