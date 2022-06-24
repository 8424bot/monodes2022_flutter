import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app_home_demo/view/root.dart';

List todoList = [
  [
    "期限切れの課題",
    DateTime.now().subtract(const Duration(days: 1)),
    const TimeOfDay(hour: 23, minute: 59).hour,
    const TimeOfDay(hour: 23, minute: 59).minute
  ]
];

void main() {
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
