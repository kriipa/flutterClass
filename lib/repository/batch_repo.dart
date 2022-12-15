import '../model/batch.dart';
import '../model/student.dart';

abstract class BatchRepository {
  Future<List<Batch>> getAllBatch();
  Future<int> addBatch(Batch batch);
  Future<List<Student>> getStudentByBatchName(String batchName);
}
