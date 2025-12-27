import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registro_vm.g.dart';

@riverpod
RegistroVM registroVM(Ref ref) {
  return RegistroVM(ref);
}

class RegistroVM {
  final Ref ref;

  RegistroVM(this.ref);

  Future<void> registrarUsuario(String nombre, String apellido, String email, String password) async {
    print(nombre);
    print(apellido);
    print(email);
    print(password);
  }

  void validarCampos() {
    // lógica
  }
}
