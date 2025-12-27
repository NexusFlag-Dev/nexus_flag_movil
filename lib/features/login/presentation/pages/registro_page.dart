import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_flag_movil/common/widgets/text_field_password.dart';
import 'package:nexus_flag_movil/features/login/presentation/manager/registro_vm.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/terminos_condiciones_text.dart';

class RegistroPage extends ConsumerStatefulWidget {
  const RegistroPage({super.key});

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends ConsumerState<RegistroPage> {
  bool _aceptaTerminos = false;
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validarNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre es requerido';
    }
    return null;
  }

  String? _validarApellido(String? value) {
    if (value == null || value.isEmpty) {
      return 'El apellido es requerido';
    }
    return null;
  }

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
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  String? _validarConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Debes confirmar la contraseña';
    }
    if (value != _passwordController.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      if (!_aceptaTerminos) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Debes aceptar los términos y condiciones'),
            backgroundColor: AppColors.accentRed,
          ),
        );
        return;
      }

      ref.read(registroVMProvider)
          .registrarUsuario(
            _nombreController.text,
            _apellidoController.text,
            _emailController.text,
            _passwordController.text,
          );
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
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Crear una cuenta',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.primaryCyan,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Nombre:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextFormField(
                    controller: _nombreController,
                    validator: _validarNombre,
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu Nombre',
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
                  Text(
                    'Apellido:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextFormField(
                    controller: _apellidoController,
                    validator: _validarApellido,
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu Apellido',
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
                  Text(
                    'Correo Electrónico:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textSecondary,
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
                  Text(
                    'Contraseña:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextFieldPassword(
                    hintText: 'Ingresa tu Contraseña',
                    controller: _passwordController,
                    validator: _validarPassword,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Confirmar Contraseña:',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextFieldPassword(
                    hintText: 'Confirma tu Contraseña',
                    controller: _confirmPasswordController,
                    validator: _validarConfirmPassword,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Checkbox(
                        value: _aceptaTerminos,
                        onChanged: (value) {
                          setState(() {
                            _aceptaTerminos = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: TerminosYCondicionesText(
                          onTerminosPressed: () {
                            //TODO navegar a términos y condiciones
                          },
                          onPrivacidadPressed: () {
                            //TODO navegar a aviso de privacidad
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _registrar,
                      child: Text('Registrarse'),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.textSecondary,
                          height: 0.1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'ó',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: AppColors.textSecondary,
                          height: 0.1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GoogleSignInButton(onPressed: () {}),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Tienes cuenta? ',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppColors.textSecondary),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/auth/login');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Iniciar Sesión',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: AppColors.accentLime),
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
