import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class RecupPwdPage extends StatefulWidget {
  const RecupPwdPage({Key? key}) : super(key: key);

  @override
  _RecupPwdPageState createState() => _RecupPwdPageState();
}

class _RecupPwdPageState extends State<RecupPwdPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
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
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu email',
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/auth/login/recuperar-pwd/confirm-recup-pwd');
                    },
                    child: const Text('Enviar Enlace'),
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