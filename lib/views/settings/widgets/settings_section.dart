import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsSection  extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection ({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ]
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}