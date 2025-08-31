import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/repositories/course_repository.dart';
import 'package:e_learning_app/services/user_service.dart';
import 'package:e_learning_app/views/teacher/my_courses/widgets/empty_courses_state.dart';
import 'package:e_learning_app/views/teacher/my_courses/widgets/my_courses_app_bar.dart';
import 'package:e_learning_app/views/teacher/my_courses/widgets/shimmer_course_card.dart';
import 'package:e_learning_app/views/teacher/my_courses/widgets/teacher_course_card.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseReppsitory = CourseRepository();
    final userService = UserService();
    final instructorId = userService.getCurrentUserId();

    if (instructorId == null) {
      return const Center(child: Text('User not logged in'));
    }
    return FutureBuilder<List<Course>>(
      future: courseReppsitory.getInstructorCourses(instructorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            appBar: AppBar(
              title: const Text('My Courses'),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context,index) => const ShimmerCourseCard(),
              ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: \\${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            appBar: AppBar(
              title: const Text('My Courses'),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: const EmptyCoursesState(),
          );
        } else {
          final teacherCourses = snapshot.data!;
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const MyCoursesAppBar(),

                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          TeacherCourseCard(course: teacherCourses[index]),
                      childCount: teacherCourses.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
