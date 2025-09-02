import 'package:e_learning_app/bloc/profile/profile_bloc.dart';
import 'package:e_learning_app/bloc/profile/profile_state.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/l10n/l10n.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profile = state.profile;

        return SliverAppBar(
          expandedHeight: 180,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.primary,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.analytics),
              icon: const Icon(Icons.analytics, color: Colors.white),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   S.of(context)!.welcomeBack,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.accent.withOpacity(0.7),
                  ),
                ),
                Text(
                  profile?.fullName ?? S.of(context)!.loading,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
