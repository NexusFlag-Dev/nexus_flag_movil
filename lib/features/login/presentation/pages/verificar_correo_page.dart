import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_flag_movil/core/auth/auth_provider.dart';
import '../../../../core/theme/app_theme.dart';

class VerificarCorreoPage extends ConsumerStatefulWidget {
  const VerificarCorreoPage({Key? key}) : super(key: key);

  @override
  _VerificarCorreoPageState createState() => _VerificarCorreoPageState();
}

class _VerificarCorreoPageState extends ConsumerState<VerificarCorreoPage> {
  bool canResendEmail = false;
  Timer? _timer;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    canResendEmail = false;
    _startResendTimer();

    // Opcional: Sondeo automático cada 5 segundos (comentado por si prefieres solo manual)
    // _timer = Timer.periodic(const Duration(seconds: 5), (_) => _checkEmailVerified(silent: true));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    setState(() => canResendEmail = false);
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) setState(() => canResendEmail = true);
    });
  }

  Future<void> _checkEmailVerified({bool silent = false}) async {
    if (!silent) setState(() => _isLoading = true);

    try {
      final authService = ref.read(authServiceProvider);
      await authService.getCurrentUser()?.reload();

      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        _timer?.cancel();
        if (mounted) {
          //context.go('/home');
          print("email verificadooooo");
        }
      } else if (!silent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Aún no detectamos la verificación. Revisa tu correo o SPAM."),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint("Error verificando: $e");
    } finally {
      if (mounted && !silent) setState(() => _isLoading = false);
    }
  }

  Future<void> _reenviarCorreo() async {
    if (!canResendEmail) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      messenger.showSnackBar(
        const SnackBar(
          content: Text("Correo reenviado. Revisa tu bandeja de entrada."),
          backgroundColor: Colors.green,
        ),
      );
      _startResendTimer();
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Error al reenviar: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _cerrarSesion() async {
    final authService = ref.read(authServiceProvider);
    await authService.signOut();
    if (mounted) context.go('/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final userEmail = FirebaseAuth.instance.currentUser?.email ?? "tu correo";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centrado para esta pantalla
              children: [
                // No ponemos botón "Atrás" arriba porque el usuario DEBE verificar o salir
                SizedBox(height: screenHeight * 0.10),

                // Icono grande para dar contexto visual
                Icon(
                    Icons.mark_email_unread_outlined,
                    size: 100,
                    color: AppColors.primaryCyan
                ),

                SizedBox(height: screenHeight * 0.05),

                Text('Verifica tu correo',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryCyan,
                    fontSize: 28, // Ajuste ligero si displayLarge es muy grande
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary
                    ),
                    children: [
                      const TextSpan(text: 'Hemos enviado un enlace de confirmación a \n'),
                      TextSpan(
                          text: userEmail,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryCyan
                          )
                      ),
                      const TextSpan(text: '.\n\nPor favor, revísalo para acceder a tu cuenta.'),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Botón Principal: Ya verifiqué
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : () => _checkEmailVerified(),
                    child: _isLoading
                        ? const SizedBox(
                        height: 24, width: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                    )
                        : const Text('Ya verifiqué el enlace'),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Opciones secundarias
                TextButton(
                  onPressed: canResendEmail ? _reenviarCorreo : null,
                  child: Text(
                    canResendEmail ? '¿No recibiste el correo? Reenviar' : 'Espera unos segundos para reenviar...',
                    style: TextStyle(
                      color: canResendEmail ? AppColors.primaryCyan : Colors.grey,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Botón Cerrar Sesión (Salida de emergencia)
                TextButton.icon(
                  onPressed: _cerrarSesion,
                  icon: const Icon(Icons.logout, color: Colors.redAccent, size: 20),
                  label: const Text(
                    'Cerrar sesión / Cambiar correo',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}