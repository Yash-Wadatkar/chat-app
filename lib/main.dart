import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/data/services/service_locator.dart';
import 'package:chat_app/presentation/screens/login/login_screen.dart';
import 'package:chat_app/router/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
await  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      navigatorKey: serviceLocator<AppRouter>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
