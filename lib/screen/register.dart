import 'package:flutter/material.dart';
import 'package:institute_objectbox/model/course.dart';
import 'package:institute_objectbox/model/student.dart';
import 'package:institute_objectbox/repository/batch_repo.dart';
import 'package:institute_objectbox/repository/course_repository.dart';
import 'package:institute_objectbox/repository/student_repo.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../model/batch.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<Batch> _lstBatches = [];
  List<Course> _lstCourses = [];
  final List<String> _selectedItems = [];
  final _gap = const SizedBox(height: 8);
  String _dropDownValue = "";

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'Rana');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  @override
  void initState() {
    _getBatches();
    _getCourses();
    super.initState();
  }

  _getBatches() async {
    _lstBatches = await BatchRepositoryImpl().getAllBatch();
  }

  _getCourses() async {
    _lstCourses = await CourseRepositoryImpl().getAllCourse();
  }

  _saveStudent() async {
    Student student = Student(
      _fnameController.text,
      _lnameController.text,
      _usernameController.text,
      _passwordController.text,
    );

    // Get the batch object from the list of batches
    final batch = _lstBatches
        .firstWhere((element) => element.batchName == _dropDownValue);

    // student.batch.targetId = batch.batchId;
    student.batch.target = batch;

    int status = await StudentRepositoryImpl().addStudent(student);
    _showMessage(status);
  }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text('Student added successfully'),
      ).show(context);
    } else {
      MotionToast.error(description: const Text('Error in adding student'))
          .show(context);
    }
  }

  List<Course> _lstCourseTemp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  FutureBuilder(
                    future: BatchRepositoryImpl().getAllBatch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select batch';
                            }
                            return null;
                          },
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: 'Select Batch',
                          ),
                          items: snapshot.data!
                              .map(
                                (batch) => DropdownMenuItem(
                                  value: batch.batchName,
                                  child: Text(batch.batchName),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            _dropDownValue = value!;
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  _gap,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Courses',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _gap,
                  FutureBuilder(
                    future: BatchRepositoryImpl().getAllBatch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MultiSelectDialogField(
                          title: const Text('Select course'),
                          items: _lstCourses
                              .map((course) =>
                                  MultiSelectItem(course, course.courseName))
                              .toList(),
                          listType: MultiSelectListType.CHIP,
                          buttonText: const Text('Select course'),
                          buttonIcon: const Icon(Icons.search),
                          onConfirm: (values) {
                            _lstCourseTemp = values;
                            debugPrint(
                                '${values.toString()} , length ${_lstCourseTemp.length}');
                          },
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select course';
                            }
                            return null;
                          }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),

                  _gap,
                  // Checkbox
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  _gap,

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _saveStudent();
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
