import 'package:institute_objectbox/model/student.dart';
import 'package:institute_objectbox/repository/student_repo.dart';

import '../../helper/objectbox.dart';
import '../../state/objectbox_state.dart';

class StudentDataSource implements StudentRepository {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  @override
  Future<int> addStudent(Student student) async {
    try {
      return objectBoxInstance.addStudent(student);
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<List<Student>> getStudents() {
    try {
      return Future.value(objectBoxInstance.getAllStudent());
    } catch (e) {
      throw Exception('Error in getting all student');
    }
  }

  @override
  Future<Student?> loginStudent(String username, String password) {
    try {
      return Future.value(objectBoxInstance.loginStudent(username, password));
    } catch (e) {
      return Future.value(null);
    }
  }
}
