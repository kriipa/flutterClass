import 'package:flutter/material.dart';
import 'package:institute_objectbox/app/theme.dart';
import 'package:institute_objectbox/screen/batch_student.dart';
import 'package:institute_objectbox/screen/dashboard.dart';
import 'package:institute_objectbox/screen/login.dart';
import 'package:institute_objectbox/screen/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student course ObjectBox',
      debugShowCheckedModeBanner: false,
      theme: getApplicationThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/registerScreen': (context) => const RegisterScreen(),
        '/dashboardScreen': (context) => const DashboardScreen(),
        '/batchStudentScreen': (context) => const BatchStudentScreen(),
      },
    );
  }
}
