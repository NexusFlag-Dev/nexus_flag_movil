
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_flag_movil/core/theme/theme_test_screen.dart';
import 'package:nexus_flag_movil/features/login/presentation/pages/confirm_recup_pwd_page.dart';
import 'package:nexus_flag_movil/features/login/presentation/pages/login_page.dart';
import 'package:nexus_flag_movil/features/login/presentation/pages/recup_pwd_page.dart';
import 'package:nexus_flag_movil/features/login/presentation/pages/registro_page.dart';
import 'package:nexus_flag_movil/features/login/presentation/pages/splash_screen.dart';
import 'package:nexus_flag_movil/features/login/presentation/pages/verificar_correo_page.dart';

final goRouterProvider =  Provider<GoRouter>((ref) {

  return GoRouter(
      initialLocation: '/',
      routes:[
        GoRoute(
            path: '/',
            name: 'Splash screen',
          builder:  (context, state) => SplashToAuthTransition(),
        ),
        GoRoute(
          path: '/auth',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AuthScreen(),
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
          routes: [
            GoRoute(
              path: '/login',
              builder: (context, state) => LoginPage(),
              routes: [
                GoRoute(
                  path: '/recuperar-pwd',
                  builder: (context, state) => RecupPwdPage(),
                  routes:[
                    GoRoute(
                      path: '/confirm-recup-pwd',
                      builder: (context, state) => ConfirmRecupPwdPage(),
                    )
                  ]
                )
              ]
            ),
            GoRoute(
              path: '/registro',
              builder: (context, state) => RegistroPage(),
            ),
            GoRoute(
              path: '/verificarEmail',
              builder: (context, state) => VerificarCorreoPage(),
            )
          ]
        ),
        GoRoute(
          path: '/theme',
          builder: (context, state) => ThemeTestScreen(),
        )
      ]
  );
},);