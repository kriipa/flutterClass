import 'package:flutter/cupertino.dart';
import 'package:institute_objectbox/screen/batch_student.dart';
import 'package:institute_objectbox/screen/course_student.dart';
import 'package:institute_objectbox/screen/dashboard.dart';
import 'package:institute_objectbox/screen/login.dart';
import 'package:institute_objectbox/screen/register.dart';
import 'package:institute_objectbox/screen/splash_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  SplashScreen.route: (context) => const SplashScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  BatchStudentScreen.route: (context) => const BatchStudentScreen(),
  CourseStudentScreen.route: (context) => const CourseStudentScreen(),
};
