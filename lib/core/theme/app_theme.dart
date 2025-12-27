import 'package:flutter/material.dart';

class AppColors {
  // Colores Principales
  static const Color primaryCyan = Color(0xFF129FF8);
  static const Color primaryBlue = Color(0xFF0099CC);
  static const Color accentLime = Color(0xFFCCFF00);

  // Fondos
  static const Color backgroundDark = Color(0xFF0A0E1A);
  static const Color surfaceDark = Color(0xFF151B2B);

  // Acentos
  static const Color accentRed = Color(0xFFFF3366);
  static const Color textSecondary = Color(0xFFA0A8B8);
  static const Color textPrimary = Color(0xFFFFFFFF);

  // Variaciones útiles (generadas)
  static const Color primaryCyanDark = Color(0xFF089BF0);
  static const Color primaryCyanLight = Color(0xFF33E0FF);
  static const Color accentLimeDark = Color(0xFFB8E600);

  // Estados
  static const Color success = accentLime;
  static const Color error = accentRed;
  static const Color warning = Color(0xFFFFAA00);
  static const Color info = primaryCyan;
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryCyan,
      primaryContainer: AppColors.primaryBlue,
      secondary: AppColors.accentLime,
      secondaryContainer: AppColors.accentLimeDark,
      tertiary: AppColors.primaryBlue,
      error: AppColors.accentRed,
      surface: AppColors.surfaceDark,
      onPrimary: AppColors.backgroundDark,
      onSecondary: AppColors.backgroundDark,
      onSurface: AppColors.textPrimary,
      onError: AppColors.textPrimary,
    ),

    // Scaffold
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
    ),

    // Elevated Buttons (Botones primarios)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // Color de fondo
        backgroundColor: AppColors.primaryCyan,

        // Color del texto/icono
        foregroundColor: AppColors.backgroundDark,

        elevation: 2,

        // Padding interno
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

        // Tamaño mínimo del botón
        minimumSize: const Size(0, 48), // altura mínima 48

        // Forma y bordes
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Cambia el radio aquí
          // Para agregar borde:
          side: BorderSide(color: AppColors.primaryCyanLight, width: 2),
        ),

        // Estilo del texto
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ).copyWith(
        // Estados interactivos (pressed, hovered, disabled)
        elevation: WidgetStateProperty.resolveWith<double>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return 0; // Sin elevación al presionar
            }
            if (states.contains(WidgetState.disabled)) {
              return 0;
            }
            return 0; // Elevación normal
          },
        ),

        // Color del overlay (efecto al presionar/hover)
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryCyanLight.withValues(alpha: 0.3);
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.primaryCyanLight.withValues(alpha: 0.1);
            }
            return null;
          },
        ),

        // Color de fondo según estado
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.textSecondary.withValues(alpha: 0.3);
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryBlue; // Más oscuro al presionar
            }
            return AppColors.primaryCyan; // Color normal
          },
        ),
      ),
    ),

    // Outlined Buttons (Botones secundarios)
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // Color del texto/icono
        foregroundColor: AppColors.primaryCyan,

        // Color y grosor del borde
        side: const BorderSide(
          color: AppColors.primaryCyan,
          width: 2, // Grosor del borde
        ),

        // Color de fondo (transparente por defecto)
        backgroundColor: Colors.transparent,

        // Padding interno
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

        // Tamaño mínimo
        minimumSize: const Size(0, 48),

        // Forma y bordes
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        // Estilo del texto
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ).copyWith(
        // Borde según estado
        side: WidgetStateProperty.resolveWith<BorderSide>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return const BorderSide(
                color: AppColors.primaryBlue,
                width: 2,
              );
            }
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: AppColors.textSecondary.withValues(alpha: 0.3),
                width: 2,
              );
            }
            return const BorderSide(
              color: AppColors.primaryCyan,
              width: 2,
            );
          },
        ),

        // Fondo según estado (opcional)
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryCyan.withValues(alpha: 0.1);
            }
            return Colors.transparent;
          },
        ),
      ),
    ),

    // Text Buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryCyan,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      // Borders
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryCyan, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentRed, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentRed, width: 2),
      ),

      // Labels y hints
      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
      errorStyle: const TextStyle(
        color: AppColors.accentRed,
        fontSize: 12,
      ),

      // Icons
      prefixIconColor: AppColors.textSecondary,
      suffixIconColor: AppColors.textSecondary,
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedItemColor: AppColors.primaryCyan,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Chips
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedColor: AppColors.primaryCyan,
      labelStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.textSecondary,
      thickness: 1,
      space: 1,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),

    // Text Theme
    textTheme: const TextTheme(
      // H1 - Títulos de pantalla (Bebas Neue)
      displayLarge: TextStyle(
        fontFamily: 'BebasNeue',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: 1.0,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        fontFamily: 'BebasNeue',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: 1.0,
        height: 1.2,
      ),

      // H2 - Secciones (Bebas Neue)
      displaySmall: TextStyle(
        fontFamily: 'BebasNeue',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: 0.8,
        height: 1.2,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'BebasNeue',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: 0.8,
        height: 1.2,
      ),

      // H3 - Subsecciones (Roboto Semibold)
      headlineMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.15,
        height: 1.3,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.15,
        height: 1.3,
      ),

      // Títulos de cards/componentes (Roboto Semibold)
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.15,
        height: 1.4,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.1,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.1,
        height: 1.4,
      ),

      // Body - Texto normal (Roboto Regular)
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        letterSpacing: 0.5,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        letterSpacing: 0.25,
        height: 1.5,
      ),

      // Caption - Texto pequeño (Roboto Regular)
      bodySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        letterSpacing: 0.4,
        height: 1.4,
      ),

      // Labels - Etiquetas (Roboto Semibold)
      labelLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 1.25,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 1.0,
        height: 1.4,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 1.5,
        height: 1.4,
      ),
    ),
  );
}