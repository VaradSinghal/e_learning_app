import 'package:e_learning_app/main_screen.dart';
import 'package:e_learning_app/views/auth/forgot_password_screen.dart';
import 'package:e_learning_app/views/auth/login_screen.dart';
import 'package:e_learning_app/views/auth/register_screen.dart';
import 'package:e_learning_app/views/course/course_list/course_list_screen.dart';
import 'package:e_learning_app/views/home/home_screen.dart';
import 'package:e_learning_app/views/onboarding/onboarding_screen.dart';
import 'package:e_learning_app/views/profile/profile_screen.dart';
import 'package:e_learning_app/views/quiz/quiz_list/widgets/quiz_list_screen.dart';
import 'package:e_learning_app/views/splash/splash_screen.dart';
import 'package:e_learning_app/views/teacher/teacher_home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String main = '/main';

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';

  static const String courseList = '/courses';

  static const String quizList = '/quizzes';

  static const String profile = '/profile';

  static const String teacherHome = '/teacher/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case teacherHome:
        return MaterialPageRoute(builder: (_) => const TeacherHomeScreen());
      case main:
        return MaterialPageRoute(
          builder:
              (_) => MainScreen(
                initialIndex:
                    settings.arguments is Map
                        ? (settings.arguments
                                as Map<String, dynamic>)['initialIndex']
                            as int?
                        : null,
              ),
        );
      case courseList:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(builder: (_) =>  CourseListScreen(
          categoryId: args?['category']as String?,
          categoryName: args?['categoryName']as String?,
        ));
      case quizList:
        return MaterialPageRoute(builder: (_) => const QuizListScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
