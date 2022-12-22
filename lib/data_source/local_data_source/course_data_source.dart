import 'package:institute_objectbox/helper/objectbox.dart';
import 'package:institute_objectbox/model/course.dart';
import 'package:institute_objectbox/model/student.dart';
import 'package:institute_objectbox/state/objectbox_state.dart';

class CourseDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addCourse(Course course) async {
    try {
      return objectBoxInstance.addCourse(course);
    } catch (e) {
      return 0;
    }
  }

  Future<List<Course>> getAllCourse() async {
    try {
      return objectBoxInstance.getAllCourse();
    } catch (e) {
      return [];
    }
  }

  Future<Course?> getCourseByCourseName(String courseName) async {
    try {
      return objectBoxInstance.getCourseByCourseName(courseName);
    } catch (e) {
      return null;
    }
  }

  Future<List<Student>> getStudentsInEachCourse(String courseName) async {
    try {
      return objectBoxInstance.getStudentsInEachCourse(courseName);
    } catch (e) {
      return [];
    }
  }
}
