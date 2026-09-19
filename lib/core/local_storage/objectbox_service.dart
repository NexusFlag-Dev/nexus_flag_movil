import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/features/auth/data/models/user_auth_ob.dart';
import 'package:nexus_flag_movil/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_service.g.dart';

class ObjectBoxService {
  ObjectBoxService._(this._store) {
    userAuthBox = Box<UserAuthOB>(_store);
  }

  late final Store _store;

  late final Box<UserAuthOB> userAuthBox;

  /// Inicialización del servicio
  static Future<ObjectBoxService> create() async {
    final dir = Directory(
      '${Directory.systemTemp.path}/integral_crm_objectbox',
    );
    final store = await openStore(directory: dir.path);
    return ObjectBoxService._(store);
  }

  /// Metodo para cerrar correctamente el Store
  void close() {
    _store.close();
  }

  /// Getter publico para acceder al Store si es necesario
  Store get store => _store;
}

@riverpod
ObjectBoxService objectBoxService(Ref ref) => throw UnimplementedError();