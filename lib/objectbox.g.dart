// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/batch.dart';
import 'model/course.dart';
import 'model/student.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6586612945106516505),
      name: 'Batch',
      lastPropertyId: const IdUid(2, 5854317376076735603),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4798991356390019797),
            name: 'batchId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 5854317376076735603),
            name: 'batchName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'student', srcEntity: 'Student', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 5048566223041025778),
      name: 'Course',
      lastPropertyId: const IdUid(2, 3039436276079246270),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4526431414428327227),
            name: 'courseId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 3039436276079246270),
            name: 'courseName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 8308014377577410811),
      name: 'Student',
      lastPropertyId: const IdUid(8, 9129848586328840050),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7335673046637371233),
            name: 'stdId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 1017982578971162734),
            name: 'fname',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1788384995854387469),
            name: 'batchId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 2454483955128625537),
            relationTarget: 'Batch'),
        ModelProperty(
            id: const IdUid(6, 661705139965883307),
            name: 'username',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4680063683494606114),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 9129848586328840050),
            name: 'lname',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 8308014377577410811),
      lastIndexId: const IdUid(1, 2454483955128625537),
      lastRelationId: const IdUid(2, 5275283626452299021),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [8567610968010343169, 771798994406263750],
      retiredRelationUids: const [3496613033538932246, 5275283626452299021],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Batch: EntityDefinition<Batch>(
        model: _entities[0],
        toOneRelations: (Batch object) => [],
        toManyRelations: (Batch object) => {
              RelInfo<Student>.toOneBacklink(5, object.batchId,
                  (Student srcObject) => srcObject.batch): object.student
            },
        getId: (Batch object) => object.batchId,
        setId: (Batch object, int id) {
          object.batchId = id;
        },
        objectToFB: (Batch object, fb.Builder fbb) {
          final batchNameOffset = fbb.writeString(object.batchName);
          fbb.startTable(3);
          fbb.addInt64(0, object.batchId);
          fbb.addOffset(1, batchNameOffset);
          fbb.finish(fbb.endTable());
          return object.batchId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Batch(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              batchId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          InternalToManyAccess.setRelInfo(
              object.student,
              store,
              RelInfo<Student>.toOneBacklink(
                  5, object.batchId, (Student srcObject) => srcObject.batch),
              store.box<Batch>());
          return object;
        }),
    Course: EntityDefinition<Course>(
        model: _entities[1],
        toOneRelations: (Course object) => [],
        toManyRelations: (Course object) => {},
        getId: (Course object) => object.courseId,
        setId: (Course object, int id) {
          object.courseId = id;
        },
        objectToFB: (Course object, fb.Builder fbb) {
          final courseNameOffset = fbb.writeString(object.courseName);
          fbb.startTable(3);
          fbb.addInt64(0, object.courseId);
          fbb.addOffset(1, courseNameOffset);
          fbb.finish(fbb.endTable());
          return object.courseId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Course(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              courseId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        }),
    Student: EntityDefinition<Student>(
        model: _entities[2],
        toOneRelations: (Student object) => [object.batch],
        toManyRelations: (Student object) => {},
        getId: (Student object) => object.stdId,
        setId: (Student object, int id) {
          object.stdId = id;
        },
        objectToFB: (Student object, fb.Builder fbb) {
          final fnameOffset = fbb.writeString(object.fname);
          final usernameOffset = fbb.writeString(object.username);
          final passwordOffset = fbb.writeString(object.password);
          final lnameOffset = fbb.writeString(object.lname);
          fbb.startTable(9);
          fbb.addInt64(0, object.stdId);
          fbb.addOffset(1, fnameOffset);
          fbb.addInt64(4, object.batch.targetId);
          fbb.addOffset(5, usernameOffset);
          fbb.addOffset(6, passwordOffset);
          fbb.addOffset(7, lnameOffset);
          fbb.finish(fbb.endTable());
          return object.stdId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Student(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              stdId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          object.batch.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.batch.attach(store);
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Batch] entity fields to define ObjectBox queries.
class Batch_ {
  /// see [Batch.batchId]
  static final batchId =
      QueryIntegerProperty<Batch>(_entities[0].properties[0]);

  /// see [Batch.batchName]
  static final batchName =
      QueryStringProperty<Batch>(_entities[0].properties[1]);
}

/// [Course] entity fields to define ObjectBox queries.
class Course_ {
  /// see [Course.courseId]
  static final courseId =
      QueryIntegerProperty<Course>(_entities[1].properties[0]);

  /// see [Course.courseName]
  static final courseName =
      QueryStringProperty<Course>(_entities[1].properties[1]);
}

/// [Student] entity fields to define ObjectBox queries.
class Student_ {
  /// see [Student.stdId]
  static final stdId =
      QueryIntegerProperty<Student>(_entities[2].properties[0]);

  /// see [Student.fname]
  static final fname = QueryStringProperty<Student>(_entities[2].properties[1]);

  /// see [Student.batch]
  static final batch =
      QueryRelationToOne<Student, Batch>(_entities[2].properties[2]);

  /// see [Student.username]
  static final username =
      QueryStringProperty<Student>(_entities[2].properties[3]);

  /// see [Student.password]
  static final password =
      QueryStringProperty<Student>(_entities[2].properties[4]);

  /// see [Student.lname]
  static final lname = QueryStringProperty<Student>(_entities[2].properties[5]);
}