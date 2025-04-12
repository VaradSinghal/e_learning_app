import 'package:e_learning_app/views/auth/forgot_password_screen.dart';
import 'package:e_learning_app/views/auth/login_screen.dart';
import 'package:e_learning_app/views/auth/register_screen.dart';
import 'package:e_learning_app/views/home/home_screen.dart';
import 'package:e_learning_app/views/onboarding/onboarding_screen.dart';
import 'package:e_learning_app/views/splash/splash_screen.dart';
import 'package:e_learning_app/views/teacher/teacher_home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';


  static const String teacherHome = '/teacher/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen(),
        );
        case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen(),
        );
        case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen(),
        );
        case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),
        );
        case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen(),
        );
        case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen(),
        );
        case teacherHome:
        return MaterialPageRoute(builder: (_) => const TeacherHomeScreen(),
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
