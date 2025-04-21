import 'package:e_learning_app/bloc/auth/auth_bloc.dart';
import 'package:e_learning_app/bloc/auth/auth_state.dart';
import 'package:e_learning_app/bloc/font/font_bloc.dart';
import 'package:e_learning_app/bloc/font/font_state.dart';
import 'package:e_learning_app/bloc/profile/profile_bloc.dart';
import 'package:e_learning_app/config/firebase_config.dart';
import 'package:e_learning_app/core/theme/app_theme.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/routes/route_pages.dart';
import 'package:e_learning_app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig.init();
  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FontBloc>(create: (context) => FontBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(
          authBloc: context.read<AuthBloc>(),
        )),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<FontBloc, FontState>(
          builder: (context, FontState) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-Learning App',
              theme: AppTheme.getLightTheme(FontState),
              themeMode: ThemeMode.light,
              initialRoute: AppRoutes.splash,
              getPages: AppPages.pages,
            );
          },
        ),
      ),
    );
  }
}
