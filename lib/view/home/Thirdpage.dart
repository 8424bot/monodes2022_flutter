// import 'package:flutter/services.dart';
// import 'package:flutter/cupertino.dart';
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyThirdPage extends StatelessWidget {
  const MyThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("プライバシーポリシー"),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: const Text(
                "\n当アプリケーションではユーザーデータの収集、使用は一切行っておりません。"
                "当アプリケーションの機能の一つとしてfirebaseに、データを登録し共有するというものがございますが、登録する際に端末情報、メールアドレス、個人名等個人情報の使用、保存は行っておりません。",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ]),
        ));
  }
}
