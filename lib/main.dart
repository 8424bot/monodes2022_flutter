import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/view/root.dart';
import 'package:app_home_demo/model/db/timetable/timetable.dart';

// ignore: constant_identifier_names
const TableBoxName = "tableBox";
List todoList = [
  [
    "期限切れの課題",
    DateTime.now().subtract(const Duration(days: 1)),
    const TimeOfDay(hour: 23, minute: 59).hour,
    const TimeOfDay(hour: 23, minute: 59).minute
  ]
];


void main() async {
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
      home: Root(),
    );
  }
}