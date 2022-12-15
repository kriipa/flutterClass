import 'package:objectbox/objectbox.dart';

@Entity()
class Course {
  @Id(assignable: true)
  int courseId;
  String courseName;

  Course(this.courseName, {this.courseId = 0});
}
