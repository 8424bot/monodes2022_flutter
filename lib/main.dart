import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/view/root.dart';
import 'package:app_home_demo/model/db/timetable/timetable.dart';

// List todoList = [
//   ["科目A ", "期限切れの課題 ", DateTime.now().subtract(const Duration(days: 1)), "S", 3]
// ];
// ignore: constant_identifier_names
const TableBoxName = "tableBox";

Future<void> main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() async {
  main2();
  await Hive.initFlutter();
  //(1) タイプアダプタを登録
  Hive.registerAdapter<TTable>(TTableAdapter());
  //(2) 型指定してボックスをオープン
  await Hive.openBox(TableBoxName);
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
