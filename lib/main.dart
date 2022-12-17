import 'package:flutter/material.dart';
import 'package:institute_objectbox/app/app.dart';
import 'package:institute_objectbox/state/objectbox_state.dart';
import 'helper/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Create an Object for ObjectBoxInstance
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();
  runApp(
    const MyApp(),
  );
}
