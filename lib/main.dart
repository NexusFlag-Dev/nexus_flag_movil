import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_flag_movil/config/app_config.dart';
import 'package:nexus_flag_movil/core/providers/config_provider.dart';
import 'package:nexus_flag_movil/core/theme/app_theme.dart';
import 'core/local_storage/objectbox_service.dart';
import 'core/routes/router_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final appEnviroment = AppEnviroment.productivo;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final objectBox = await ObjectBoxService.create();

  runApp(ProviderScope(
    overrides: [
      baseUrlProvider.overrideWithValue(AppConfig.getBaseUrl(appEnviroment)),
      objectBoxServiceProvider.overrideWithValue(objectBox),
    ],
    child: const MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

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
