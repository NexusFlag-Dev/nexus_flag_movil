import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/features/login/presentation/manager/login_vm.dart'; // Importa tu VM

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenemos los datos del usuario del estado del LoginVM
    final authState = ref.watch(loginVMProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.red),
            onPressed: () {
              // Llamamos al método que acabamos de crear
              ref.read(loginVMProvider.notifier).signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "¡Bienvenido!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Mostramos el nombre o email para confirmar que el estado existe
            Text("Usuario: ${authState.email ?? 'Desconocido'}"),
            const SizedBox(height: 10),
            Text("Rol: ${authState.role ?? 'Sin rol'}"),
          ],
        ),
      ),
    );
  }
}