import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:institute_objectbox/repository/student_repo.dart';
import 'package:institute_objectbox/screen/register.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String route = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  _login() async {
    final student = await StudentRepositoryImpl()
        .loginStudent(_usernameController.text, _passwordController.text);
    if (student != null) {
      _setDataToSharedPref(_usernameController.text,_passwordController.text);
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() {
    Navigator.pushNamed(context, DashboardScreen.route);
  } 

  _showMessage() {
    MotionToast.error(description: const Text('Invalid username or password'))
        .show(context);
  }

  _setDataToSharedPref(String username, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('password', password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _usernameController,
                      onSaved: (newValue) {
                        setState(() {
                          _usernameController.text = newValue!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: Colors.green[400],
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30.0),
                      //   ),
                      // ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30.0),
                      //   ),
                      // ),
                      onPressed: () {
                        // SharedPreferences;
                        Navigator.pushNamed(context, RegisterScreen.route);
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
