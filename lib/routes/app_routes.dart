import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => 
            const Scaffold(
              body: Center(child: Text('Route not found!')
              ),
            )
            );
    }
  }
}