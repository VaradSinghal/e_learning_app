import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TeacherAnalysisAppBar extends StatelessWidget {
  const TeacherAnalysisAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: IconButton(
        onPressed: ()=> Get.back(), 
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.accent,
        ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:  EdgeInsets.only(
            left: MediaQuery.of(context).size.width *0.15,
            bottom: 16,
          ),
          title: Text(
            'Course Analytics',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.bold,
            ),
          ),
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primaryLight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
                ),
            ),
          ),
        ),
    );
  }
}