import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/services/dummy_data_service.dart';
import 'package:e_learning_app/views/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class ActionButtons extends StatelessWidget {
  final Course course;
  final bool isUnlocked;

  const ActionButtons({
    super.key,
    required this.course,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (course.isPremium && !isUnlocked) {
                Get.toNamed(
                  AppRoutes.payment,
                  arguments: {
                    'courseId': course.id,
                    'courseName': course.title,
                    'price': course.price,
                  },
                );
              } else {
                Get.toNamed(
                  AppRoutes.lesson.replaceAll(':id', course.lessons.first.id),
                  parameters: {'courseId': course.id},
                );
              }
            },
            label: const Text('Start Learning'),
            icon: const Icon(Icons.play_circle),
          ),
        ),

        if (!course.isPremium || isUnlocked) ...{
          const SizedBox(width: 16),
          IconButton(
            onPressed:
                () => Get.to(
                  () => ChatScreen(
                    courseId: course.id,
                    instructorId: course.instructorId,
                    isTeacherView: false,
                  ),
                ),
            icon: const Icon(Icons.chat),
          ),
        },
      ],
    );
  }
}
