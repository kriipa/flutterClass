import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:institute_objectbox/app/app.dart';
import 'package:institute_objectbox/state/objectbox_state.dart';
import 'helper/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Delete database
  //ObjectBoxInstance.deleteDatabase();
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();
  // Load data from json file
  //LoadFromJsonRepositoryImpl().loadFromJson();
  // Disable landscape mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}
