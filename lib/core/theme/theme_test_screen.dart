// lib/debug/theme_test_screen.dart
import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeTestScreen extends StatelessWidget {
  const ThemeTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Theme Tester'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================
            // SECCIÓN: COLORES
            // ============================================
            _buildSection('COLORES', [
              _buildColorBox('Primary Cyan', AppColors.primaryCyan),
              _buildColorBox('Primary Blue', AppColors.primaryBlue),
              _buildColorBox('Accent Lime', AppColors.accentLime),
              _buildColorBox('Accent Red', AppColors.accentRed),
              _buildColorBox('Background', AppColors.backgroundDark),
              _buildColorBox('Surface', AppColors.surfaceDark),
              _buildColorBox('Text Primary (Blanco)', AppColors.textPrimary),
              _buildColorBox('Text Secondary (Gris)', AppColors.textSecondary),
            ]),

            const SizedBox(height: 32),

            // ============================================
            // SECCIÓN: TIPOGRAFÍA CON DIFERENTES COLORES
            // ============================================
            _buildSection('TIPOGRAFÍA - COLORES VARIADOS', [
              // Display Large con diferentes colores
              _buildTextExample(
                context,
                'Display Large (Blanco - Default)',
                Theme.of(context).textTheme.displayLarge,
              ),
              _buildTextExample(
                context,
                'Display Large (Cyan)',
                Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.primaryCyan,
                ),
              ),
              _buildTextExample(
                context,
                'Display Large (Lime)',
                Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.accentLime,
                ),
              ),
              _buildTextExample(
                context,
                'Display Large (Red)',
                Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.accentRed,
                ),
              ),

              const Divider(height: 32),

              // Display Medium
              _buildTextExample(
                context,
                'Display Medium (Default)',
                Theme.of(context).textTheme.displayMedium,
              ),
              _buildTextExample(
                context,
                'Display Medium (Cyan)',
                Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primaryCyan,
                ),
              ),

              const Divider(height: 32),

              // Headline
              _buildTextExample(
                context,
                'Headline Medium (Default)',
                Theme.of(context).textTheme.headlineMedium,
              ),
              _buildTextExample(
                context,
                'Headline Medium (Cyan)',
                Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryCyan,
                ),
              ),

              const Divider(height: 32),

              // Body
              _buildTextExample(
                context,
                'Body Large (Default)',
                Theme.of(context).textTheme.bodyLarge,
              ),
              _buildTextExample(
                context,
                'Body Medium (Gris)',
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              _buildTextExample(
                context,
                'Body Small (Default gris)',
                Theme.of(context).textTheme.bodySmall,
              ),
            ]),

            const SizedBox(height: 32),

            // ============================================
            // SECCIÓN: MODIFICACIONES MÚLTIPLES
            // ============================================
            _buildSection('TIPOGRAFÍA - MODIFICACIONES MÚLTIPLES', [
              _buildTextExample(
                context,
                'Cyan + Extra Bold',
                Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.w900,
                ),
              ),
              _buildTextExample(
                context,
                'Lime + Italic',
                Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.accentLime,
                  fontStyle: FontStyle.italic,
                ),
              ),
              _buildTextExample(
                context,
                'Red + Underline',
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.accentRed,
                  decoration: TextDecoration.underline,
                ),
              ),
              _buildTextExample(
                context,
                'Cyan + Letter Spacing',
                Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primaryCyan,
                  letterSpacing: 3.0,
                ),
              ),
            ]),

            const SizedBox(height: 32),

            // ============================================
            // SECCIÓN: BOTONES
            // ============================================
            _buildSection('BOTONES', [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button (Cyan)'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button (Cyan)'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Text Button (Cyan)'),
                ),
              ),
              const SizedBox(height: 16),

              // Botón personalizado
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentLime,
                    foregroundColor: AppColors.backgroundDark,
                  ),
                  child: const Text('Botón Lime Personalizado'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentRed,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Botón Rojo Personalizado'),
                ),
              ),
            ]),

            const SizedBox(height: 32),

            // ============================================
            // SECCIÓN: CARDS Y COMPONENTES
            // ============================================
            _buildSection('CARDS Y COMPONENTES', [
              // Card básica
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card con título default',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Contenido de la card con texto normal',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Card con colores personalizados
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TÍTULO EN CYAN'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primaryCyan,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Subtítulo en gris secundario',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '125 - 118',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: AppColors.accentLime,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Card estilo partido en vivo
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge LIVE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'LIVE',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      Text(
                        'Lakers vs Warriors',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '95',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: AppColors.primaryCyan,
                            ),
                          ),
                          Text(
                            'VS',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '92',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: AppColors.primaryCyan,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Text(
                        'Cuarto 3 • 5:23 restantes',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ]),

            const SizedBox(height: 32),

            // ============================================
            // SECCIÓN: BADGES Y ETIQUETAS
            // ============================================
            _buildSection('BADGES Y ETIQUETAS', [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildBadge('LIVE', AppColors.accentRed, context),
                  _buildBadge('EN VIVO', AppColors.primaryCyan, context),
                  _buildBadge('VICTORIA', AppColors.accentLime, context),
                  _buildBadge('NUEVO', AppColors.primaryBlue, context),
                  _buildBadge('HOT', AppColors.accentRed, context),
                ],
              ),
            ]),

            const SizedBox(height: 32),

            // ============================================
            // SECCIÓN: CASOS DE USO REALES
            // ============================================
            _buildSection('CASOS DE USO REALES', [
              // Ejemplo 1: Estadística destacada
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'PUNTOS TOTALES',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1,847',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.accentLime,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Ejemplo 2: Lista de ranking
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      '1',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.primaryCyan,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jugador Destacado',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '1,500 puntos',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '+150',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.accentLime,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ]),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ============================================
  // WIDGETS HELPER
  // ============================================

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryCyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryCyan,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildColorBox(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white24),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextExample(BuildContext context, String text, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: style),
          const SizedBox(height: 4),
          Text(
            'Tamaño: ${style?.fontSize?.toStringAsFixed(0) ?? "N/A"}px | '
                'Peso: ${style?.fontWeight?.toString().split('.').last ?? "N/A"}',
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}