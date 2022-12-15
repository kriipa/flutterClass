import 'package:institute_objectbox/model/student.dart';
import 'package:objectbox/objectbox.dart';

//flutter pub run build_runner build  --delete-conflicting-outputs

@Entity()
class Batch {
  @Id(assignable: true)
  int batchId;
  String batchName;

  @Backlink()
  final student = ToMany<Student>();

  Batch(this.batchName, {this.batchId = 0});
}
