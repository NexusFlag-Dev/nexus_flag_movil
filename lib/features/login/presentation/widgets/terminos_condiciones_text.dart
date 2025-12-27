import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class TerminosYCondicionesText extends StatelessWidget {
  final VoidCallback onTerminosPressed;
  final VoidCallback onPrivacidadPressed;

  const TerminosYCondicionesText({
    super.key,
    required this.onTerminosPressed,
    required this.onPrivacidadPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'He leído y acepto los ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary
          ),
        ),
        TextButton(
          onPressed: onTerminosPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Términos',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accentLime,
            ),
          ),
        ),
        TextButton(
          onPressed: onTerminosPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            ' y ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accentLime
            ),
          ),
        ),
        TextButton(
          onPressed: onTerminosPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Condiciones',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accentLime
            ),
          ),
        ),
        Text(
          ' y el ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary
          ),
        ),
        TextButton(
          onPressed: onPrivacidadPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Aviso',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accentLime
            ),
          ),
        ),
        TextButton(
          onPressed: onPrivacidadPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            ' de ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color:AppColors.accentLime
            ),
          ),
        ),
        TextButton(
          onPressed: onPrivacidadPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Privacidad.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accentLime
            ),
          ),
        ),
      ],
    );
  }
}