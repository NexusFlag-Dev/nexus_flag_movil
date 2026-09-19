import 'package:nexus_flag_movil/features/auth/data/datasources/local/user_auth_dao.dart';
import 'package:nexus_flag_movil/features/auth/data/mappers/auth_mapper.dart';
import 'package:nexus_flag_movil/features/auth/domain/entities/user_entity.dart';

import '../../../../../objectbox.g.dart';
import '../../models/user_auth_ob.dart';

class UserAuthUserImplOB extends UserAuthDAO {

  UserAuthUserImplOB(this._userAuthBox);
  final Box<UserAuthOB> _userAuthBox;
  @override
  Future deleteUserAuth() async {
    _userAuthBox.removeAllAsync();
    return true;
  }

  @override
  Future<UserEntity?> getUserAuth() async {
    final users = await _userAuthBox.getAllAsync();
    final userAuth =  users.firstOrNull;
    if(userAuth != null){
      return userAuth.toEntity();
    }
    return null;
  }

  @override
  Future saveUserAuth(UserEntity userAuth) async {
    await _userAuthBox.removeAllAsync();
    await _userAuthBox.putAsync(userAuth.toOB());
  }

}