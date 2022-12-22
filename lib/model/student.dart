import 'package:institute_objectbox/model/batch.dart';
import 'package:institute_objectbox/model/course.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Student {
  @Id(assignable: true)
  int stdId;
  String fname;
  String lname;
  String username;
  String password;

  final batch = ToOne<Batch>();
  final course = ToMany<Course>();

  Student(this.fname, this.lname, this.username, this.password,
      {this.stdId = 0});
}
