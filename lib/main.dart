import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/core/theme/app_theme.dart';
import 'core/routes/router_provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(goRouterProvider);
    return MaterialApp.router(
      routerConfig: routes,
      title: 'Nexus Flag',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
