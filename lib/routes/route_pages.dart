import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/views/auth/forgot_password_screen.dart';
import 'package:e_learning_app/views/auth/login_screen.dart';
import 'package:e_learning_app/views/auth/register_screen.dart';
import 'package:e_learning_app/views/home/home_screen.dart';
import 'package:e_learning_app/views/onboarding/onboarding_screen.dart';
import 'package:e_learning_app/views/splash/splash_screen.dart';
import 'package:e_learning_app/views/teacher/teacher_home_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      ),
      GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      ),
      GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      ),
      GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      ),
      GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
      ),
      GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      ),
      GetPage(
      name: AppRoutes.teacherHome,
      page: () => const TeacherHomeScreen(),
      ),
  ];
}
