import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'screens/detail_quiz_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const dashboard = '/dashboard';
  static const quiz = '/quiz';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lumi Learning',
      theme: buildAppTheme(),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.register: (_) => const RegisterScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.dashboard: (_) => const DashboardScreen(),
        AppRoutes.quiz: (_) => const DetailQuizScreen(),
      },
    );
  }
}
