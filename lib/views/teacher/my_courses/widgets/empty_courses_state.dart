import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
            'No Courses Yet',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primary.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: (){
              
            }, 
            child: const Text(
              'Create your first course',
              ),
              ),
        ],
      ),
    );
  }
}