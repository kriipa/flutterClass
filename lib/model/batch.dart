import 'package:institute_objectbox/model/student.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Batch {
  @Id(assignable: true)
  int batchId;
  String batchName;

  @Backlink()
  final student = ToMany<Student>();

  //Constructor
  Batch(this.batchName, {this.batchId = 0});
}



//flutter pub run build_runner build  --delete-conflicting-outputs