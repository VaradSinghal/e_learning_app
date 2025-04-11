import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      )
  ];
}
