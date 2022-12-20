import 'package:flutter/material.dart';
import 'package:institute_objectbox/app/routes.dart';
import 'package:institute_objectbox/app/theme.dart';

import '../screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student course ObjectBox',
      debugShowCheckedModeBanner: false,
      theme: getApplicationThemeData(),
      initialRoute: SplashScreen.route,
      routes: getAppRoutes,
    );
  }
}
