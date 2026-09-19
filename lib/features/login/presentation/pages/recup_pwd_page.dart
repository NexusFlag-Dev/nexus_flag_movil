import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_flag_movil/core/auth/auth_provider.dart';

import '../../../../core/theme/app_theme.dart';

class RecupPwdPage extends ConsumerStatefulWidget {
  const RecupPwdPage({Key? key}) : super(key: key);

  @override
  _RecupPwdPageState createState() => _RecupPwdPageState();
}

class _RecupPwdPageState extends ConsumerState<RecupPwdPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validarEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo electrónico es requerido';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido';
    }
    return null;
  }

  Future<void> _recuperarPassword() async {
    if (_formKey.currentState!.validate()) {

      final authService = ref.read(authServiceProvider);
      final messenger = ScaffoldMessenger.of(context);

      if(await authService.canSendEmail()){
        final response = await authService.resetPassword(_emailController.text);
        if (response) {
          context.go('/auth/login/recuperar-pwd/confirm-recup-pwd');
        }  else {
          messenger.showSnackBar(
            const SnackBar(
              content: Text("Error al enviar el correo. Inténtalo más tarde."),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        messenger.showSnackBar(
          const SnackBar(
            content: Text("Espera un momento antes de solicitar otro correo."),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(-12, 0),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryCyan,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  Text('Recuperar Contraseña',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.primaryCyan
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text('Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para '
                      'restablecer tu contraseña',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextFormField(
                    controller: _emailController,
                    validator: _validarEmail,
                    decoration: const InputDecoration(
                      hintText: 'Ingresa tu email',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _recuperarPassword,
                      child: const Text('Enviar Enlace'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}