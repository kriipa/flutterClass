import '../model/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();
  Future<int> addStudent(Student student);
  Future<Student?> loginStudent(String username, String password);
}
