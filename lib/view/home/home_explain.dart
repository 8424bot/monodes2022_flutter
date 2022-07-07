import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomeExplainPage extends StatelessWidget {
  const MyHomeExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("説明"),
        ),
        body: Center(
          child: Column(children: <Widget>[]),
        ));
  }
}

// Text.rich(TextSpan(children: [
              //   TextSpan(
              //     text: "\n1.homeタブ\n"
              //         "アプリ起動時のページです。アプリの使い方などを確認できます。"
              //         "”Your Status”を自分の所属に設定することでTodoタブにて対象となっている課題を確認できます。"