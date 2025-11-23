import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;
Future<void> setupServiceLocator() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator.registerLazySingleton<AppRouter>(() => AppRouter());
}

/// register singleton : create single instance and use it everywhere
/// register lazy singleton : create single instance when u require it
/// register factory : create new instance everytime u require
