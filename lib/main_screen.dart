import 'package:e_learning_app/bloc/navigation/navigation_bloc.dart';
import 'package:e_learning_app/bloc/navigation/navigation_state.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/l10n/l10n.dart';
import 'package:e_learning_app/views/course/course_list/course_list_screen.dart';
import 'package:e_learning_app/views/home/home_screen.dart';
import 'package:e_learning_app/views/profile/profile_screen.dart';
import 'package:e_learning_app/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/bloc/navigation/navigation_event.dart';

class MainScreen extends StatelessWidget {
  final int? initialIndex;
  const MainScreen({super.key, this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NavigationBloc()..add(NavigateToTab(initialIndex ?? 0)),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            body: IndexedStack(
              index: state.currentIndex,
              children:  [
                HomeScreen(),
                const CourseListScreen(),
                const QuizListScreen(),
                const ProfileScreen(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: AppColors.accent,
              indicatorColor: AppColors.primary.withOpacity(0.1),
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  label: S.of(context)!.navHome,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.play_lesson_outlined),
                  selectedIcon: const Icon(Icons.play_lesson),
                  label: S.of(context)!.navCourses,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.quiz_outlined),
                  selectedIcon: const Icon(Icons.quiz),
                  label: S.of(context)!.navQuizzes,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  label: S.of(context)!.navProfile,
                ),
              ],
              selectedIndex: state.currentIndex,
              onDestinationSelected: (index) {
                context.read<NavigationBloc>().add(NavigateToTab(index));
              },
            ),
          );
        },
      ),
    );
  }
}
