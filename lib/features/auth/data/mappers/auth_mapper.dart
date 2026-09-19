
import 'package:nexus_flag_movil/features/auth/data/models/auth_response.dart';
import 'package:nexus_flag_movil/features/auth/data/models/user_auth_ob.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/auth_entity.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/user_entity.dart';

extension AuthMapper on AuthResponse{
  AuthEntity toEntity(){
    return AuthEntity(
        user: UserEntity(
            id: user.id,
            email: user.email,
            firstName: user.firstName,
            lastName: user.lastName,
            role: user.role,
            firebaseUid: user.firebaseUid
        ),
        accessToken: tokens.access,
        refreshToken: tokens.refresh
    );
  }
}

extension UserAuthMapper on UserEntity{
  UserAuthOB toOB() => UserAuthOB(
      obxId: id,
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      photo: photo,
      firebaseUid: firebaseUid,
      lastUpdated: DateTime.now()
  );
}

extension UserObMapper on UserAuthOB{

  UserEntity toEntity() => UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      photo: photo,
      firebaseUid: firebaseUid
  );
}