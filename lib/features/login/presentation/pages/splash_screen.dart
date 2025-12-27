import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class SplashToAuthTransition extends StatefulWidget {
  const SplashToAuthTransition({Key? key}) : super(key: key);

  @override
  State<SplashToAuthTransition> createState() => _SplashToAuthTransitionState();
}

class _SplashToAuthTransitionState extends State<SplashToAuthTransition> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(milliseconds: 500));

    FlutterNativeSplash.remove();

    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/imagenes/logo/nexus_flag_logo_nombre.png',
          width: screenWidth * 0.75,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _breathingController;
  late Animation<double> _breathingAnimation;

  @override
  void initState() {
    super.initState();

    // Efecto de respiración de la luz
    _breathingController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _breathingAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _breathingController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _breathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.black,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Efecto de luz respirando detrás del logo
            Center(
              child: AnimatedBuilder(
                animation: _breathingAnimation,
                builder: (context, child) {
                  return Container(
                    width: 300 * _breathingAnimation.value,
                    height: 300 * _breathingAnimation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.3 * _breathingAnimation.value),
                          blurRadius: 100 * _breathingAnimation.value,
                          spreadRadius: 50 * _breathingAnimation.value,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Logo combinado centrado
            Center(
              child: Image.asset(
                'assets/imagenes/logo/nexus_flag_logo_nombre.png',
                width: screenWidth * 0.75,
                fit: BoxFit.contain,
              ),
            ),

            // Botones en la parte inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Botón de inicio de sesión
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/auth/login');
                          },

                          child: const Text(
                            'Iniciar Sesión',

                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Botón de registro
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () {
                            // Navegar a pantalla de registro
                            context.push('/auth/registro');
                          },
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}