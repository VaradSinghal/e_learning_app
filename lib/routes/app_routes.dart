import 'package:e_learning_app/main_screen.dart';
import 'package:e_learning_app/views/auth/forgot_password_screen.dart';
import 'package:e_learning_app/views/auth/login_screen.dart';
import 'package:e_learning_app/views/auth/register_screen.dart';
import 'package:e_learning_app/views/chat/chat_list_screen.dart';
import 'package:e_learning_app/views/course/analytics_dashboard/analytics_dashboard_screen.dart';
import 'package:e_learning_app/views/course/course_detail/course_detail_screen.dart';
import 'package:e_learning_app/views/course/course_list/course_list_screen.dart';
import 'package:e_learning_app/views/course/create_course/create_course_screen.dart';
import 'package:e_learning_app/views/course/lesson_screen/lesson_screen.dart';
import 'package:e_learning_app/views/course/payment/payment_screen.dart';
import 'package:e_learning_app/views/help_and_support/help_and_support_screen.dart';
import 'package:e_learning_app/views/home/home_screen.dart';
import 'package:e_learning_app/views/notifications/notifications_screen.dart';
import 'package:e_learning_app/views/onboarding/onboarding_screen.dart';
import 'package:e_learning_app/views/privacy_&_terms_conditions/privacy_policy_screen.dart';
import 'package:e_learning_app/views/privacy_&_terms_conditions/terms_conditions_screen.dart';
import 'package:e_learning_app/views/profile/edit_profile_screen.dart';
import 'package:e_learning_app/views/profile/profile_screen.dart';
import 'package:e_learning_app/views/quiz/quiz_attempt/quiz_attempt_screen.dart';
import 'package:e_learning_app/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:e_learning_app/views/settings/settings_screen.dart';
import 'package:e_learning_app/views/splash/splash_screen.dart';
import 'package:e_learning_app/views/teacher/my_courses/my_courses_screen.dart';
import 'package:e_learning_app/views/teacher/student_progress/student_progress_screen.dart';
import 'package:e_learning_app/views/teacher/teacher_analytics/teacher_analytics_screen.dart';
import 'package:e_learning_app/views/teacher/teacher_home/teacher_home_screen.dart';
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
  static const String courseDetail = '/course/:id';
  static const String payment = '/payment';
  static const String analytics= '/analytics';
  static const String lesson = '/lesson/:id';

  static const String quizList = '/quizzes';
  static const String quizAttempt = '/quiz/:id';
  static const String quizResult = '/quiz/result';

  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String notifications = '/notifications';
  static const String setting = '/setting';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsConditions = '/terms-conditions';
  static const String helpSupport = '/help-support';

  static const String teacherHome = '/teacher/home';
  static const String myCourses = '/teacher/courses';
  static const String teacherChats = '/teacher/chats';
  static const String createCourse = '/teacher/courses/create';
  static const String teacherAnalytics = '/teacher/analytics';
  static const String studentProgress = '/teacher/students';

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
      case myCourses:
        return MaterialPageRoute(builder: (_) => const MyCoursesScreen());
      case createCourse:
        return MaterialPageRoute(builder: (_) => const CreateCourseScreen());
      case teacherChats:
        return MaterialPageRoute(builder: (_) => const ChatListScreen());
      case teacherAnalytics:
        return MaterialPageRoute(builder: (_) => const TeacherAnalyticsScreen());
      case studentProgress:
        return MaterialPageRoute(builder: (_) => const StudentProgressScreen());
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
        return MaterialPageRoute(
          builder:
              (_) => CourseListScreen(
                categoryId: args?['category'] as String?,
                categoryName: args?['categoryName'] as String?,
              ),
        );

      case courseDetail:
        String courseId;
        if (settings.arguments != null) {
          courseId = settings.arguments as String;
        } else {
          final uri = Uri.parse(settings.name ?? '');
          courseId = uri.pathSegments.last;
        }
        return MaterialPageRoute(
          builder: (_) => CourseDetailScreen(courseId: courseId),
        );

      case quizList:
        return MaterialPageRoute(builder: (_) => const QuizListScreen());
      case quizAttempt:
        final quizId = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => QuizAttemptScreen(
          quizId: quizId ?? '',
        ));
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case privacyPolicy:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case termsConditions:
        return MaterialPageRoute(builder: (_) => const TermsConditionsScreen());
      case helpSupport:
        return MaterialPageRoute(builder: (_) => const HelpAndSupportScreen());
      case analytics:
        return MaterialPageRoute(builder: (_) =>  AnalyticsDashboardScreen());
      case payment:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => PaymentScreen(
                courseId: args['courseId'] ?? '',
                courseName: args['courseName'] ?? '',
                price: args['price'] ?? 0.0,
              ),
        );

      case lesson:
        final lessonId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => LessonScreen(lessonId: lessonId ?? ''),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
