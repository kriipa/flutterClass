import 'package:flutter/cupertino.dart';

import '../screen/batch_student.dart';
import '../screen/dashboard.dart';
import '../screen/login.dart';
import '../screen/register.dart';
import '../screen/splash_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  SplashScreen.route: (context) => const SplashScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  BatchStudentScreen.route: (context) => const BatchStudentScreen(),
};
