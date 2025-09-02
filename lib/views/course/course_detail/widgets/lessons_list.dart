import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/repositories/course_repository.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/views/course/course_detail/widgets/lesson_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LessonsList extends StatefulWidget {
  final String courseId;
  final bool isUnlocked;
  final VoidCallback? onLessonComplete;

  const LessonsList({
    super.key,
    required this.courseId,
    required this.isUnlocked,
    this.onLessonComplete,
  });

  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  final CourseRepository _courseRepository = CourseRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Course? _course;
  bool _isLoading = true;
  Set<String> _completedLessons = {};

  initState() {
    super.initState();
    _loadCourse();
  }

  @override
  void didUpdateWidget(LessonsList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.courseId != widget.courseId ||
        oldWidget.isUnlocked != widget.isUnlocked) {
      _loadCourse();
    }
  }

  Future<void> _loadCourse() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final user = _auth.currentUser;
      if (user == null) {
        setState(() {
          _isLoading = false;
        });
        Get.snackbar(
          'Error',
          'Please login to view course progress',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      final course = await _courseRepository.getCourseDetail(widget.courseId);
      final completedLessons = await _courseRepository.getCompletedLessons(
        widget.courseId,
        user.uid,
      );

      if (mounted) {
        setState(() {
          _course = course;
          _completedLessons = completedLessons;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        Get.snackbar(
          'Error',
          'Failed to load course lesson',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_course == null) {
      return const Center(child: Text('No lessons available'));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _course!.lessons.length,
      itemBuilder: (context, index) {
        final lesson = _course!.lessons[index];
        final isCompleted = _completedLessons.contains(lesson.id);
        final isLocked =
            !lesson.isPreview &&
            (index > 0 &&
                !_completedLessons.contains(_course!.lessons[index - 1].id));

        return LessonTile(
          title: lesson.title,
          duration: '${lesson.duration} min',
          isCompleted: isCompleted,
          isLocked: isLocked,
          isUnlocked: widget.isUnlocked,
          onTap: () async {
            if (_course!.isPremium && !widget.isUnlocked) {
              Get.snackbar(
                'Premium Course',
                'Please purchase to access all lessons',
                backgroundColor: AppColors.primary,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            } else if (isLocked) {
              Get.snackbar(
                'Lesson Locked',
                'Please complete the previous lesson first',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            } else {
              final result = await Get.toNamed(
                AppRoutes.lesson.replaceAll(':id', lesson.id),
                parameters: {'courseId': widget.courseId},
              );

              if (result == true) {
                await _loadCourse();
                widget.onLessonComplete?.call();
              }
            }
          },
        );
      },
    );
  }
}
