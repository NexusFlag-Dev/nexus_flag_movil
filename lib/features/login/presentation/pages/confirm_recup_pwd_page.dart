import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class ConfirmRecupPwdPage extends StatelessWidget {
  const ConfirmRecupPwdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Icon(
                    Icons.mark_email_read_outlined,
                    size: screenWidth * 0.4,
                    color: AppColors.primaryCyan,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Correo Enviado',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryCyan,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Revisa tu bandeja de entrada (y spam). Hemos enviado las instrucciones a tu correo.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.04),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/auth/login');
                    },
                    child: const Text('Volver al Login'),
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