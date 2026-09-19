import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            onPressed();
          },
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo de Google
                Image.network(
                  'https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 24),
                // Texto
                Text(
                  'Iniciar Sesión con Google',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.backgroundDark
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