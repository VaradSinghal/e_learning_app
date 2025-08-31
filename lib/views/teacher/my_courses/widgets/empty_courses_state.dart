import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmptyCoursesState extends StatelessWidget {
  const EmptyCoursesState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            color: AppColors.primary.withOpacity(0.1),
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            'Start Your Teaching Journey',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Create Your First Course',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.createCourse),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
              backgroundColor: AppColors.primary,
            ),
            child: const Text(
              'Create Course',
              style: TextStyle(fontSize: 16),
              ),
              ),
        ],
      ),
    );
  }
}