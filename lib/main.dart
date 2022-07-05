// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/view/root.dart';
import 'package:app_home_demo/model/db/timetable/timetable.dart';
import 'package:app_home_demo/model/db/home/CourseGrade.dart';
import 'package:path_provider/path_provider.dart';

List<Box> boxList = [];
Future<List<Box>> _openBox() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var TTableBox = await Hive.openBox('TT');
  var CGBox = await Hive.openBox('CG');
  boxList.add(TTableBox);
  boxList.add(CGBox);
  return boxList;
}

Future<void> main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() async {
  main2();
  await Hive.initFlutter();
  //(1) タイプアダプタを登録
  Hive.registerAdapter<TTable>(TTableAdapter());
  Hive.registerAdapter<CG>(CGAdapter());
  //(2) 型指定してボックスをオープン
  await _openBox();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}