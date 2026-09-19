import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_flag_movil/common/widgets/text_field_password.dart';
import 'package:nexus_flag_movil/core/theme/app_theme.dart';
import 'package:nexus_flag_movil/features/login/presentation/widgets/google_sign_in_button.dart';

import '../manager/login_vm.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  String? _validarPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }
    return null;
  }

  void _iniciarSesion() {
    if (_formKey.currentState!.validate()) {
        ref.read(loginVMProvider.notifier).loginEmailPassword(
            _emailController.text, _passwordController.text
        );
        context.go('/auth/verificarEmail');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
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
                  ),
                  Center(
                    child: Transform.scale(
                      scale: 1.4,
                      child: Image.asset(
                        'assets/imagenes/logo/nexus_flag_logo_nombre.png',
                        width: screenWidth * 0.50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text('Iniciar Sesión',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.primaryCyan
                    ),),
                  SizedBox(height: screenHeight * 0.01),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Correo Electrónico:',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textSecondary
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextFormField(
                    controller: _emailController,
                    validator: _validarEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu Email',
                      errorStyle: TextStyle(color: AppColors.accentRed),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.accentRed),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.accentRed),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Contraseña:',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textSecondary
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextFieldPassword(
                    hintText: 'Ingresa tu Contraseña',
                    controller: _passwordController,
                    validator: _validarPassword,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go('/auth/login/recuperar-pwd');
                      },
                      child: Text('¿Olvidaste tu contraseña?',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.primaryCyan
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _iniciarSesion,
                      child: const Text(
                        'Iniciar Sesión',
              
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    children: [
                      const Expanded(child: Divider(color: AppColors.textSecondary, height: 0.1,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('ó',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppColors.textSecondary
                          ),),
                      ),
                      const Expanded(child: Divider(color: AppColors.textSecondary, height: 0.1)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  GoogleSignInButton(
                    onPressed: () {
                      ref.read(loginVMProvider.notifier).loginWithGoogle();
                      },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes cuenta? ',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/auth/registro');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Regístrate',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.accentLime,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}