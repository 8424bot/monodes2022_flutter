import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMemoExplainPage extends StatelessWidget {
  const MyMemoExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("説明4"),
        ),
        body: Center(
          child: Column(children: <Widget>[]),
        ));
  }
}
//         "\n\n4.Linksタブ\n",
              //     style: TextStyle(fontSize: 15),
              //   ),
              //   TextSpan(
              //     text: "個人的なメモや様々なページへのリンクなどを保存できるページです。右下のボタンをタップすると登録ができます。"
              //         "リストの項目をタップすると詳細を確認でき、URLを登録していた場合はそのページを開くことができます。URLの欄に文字を入力することでメモ帳代わりにも使えます。"
              //         "項目を左にスライドすると編集と削除が行えます。\n",
