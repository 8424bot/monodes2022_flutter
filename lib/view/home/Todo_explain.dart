import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTodoExplainPage extends StatelessWidget {
  const MyTodoExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("説明2"),
        ),
        body: Center(
          child: Column(children: <Widget>[]),
        ));
  }
}

//         "\n\n2.Todoタブ\n"
              //         "ユーザー全員で共有の課題掲示板です。課題情報の投稿と自分の学科・学年に割りあてられた課題情報の確認ができます。"
              //         "課題の提出期限が１日以内に迫ると文字が",
              //     style: TextStyle(fontSize: 15),
              //   ),
              //   TextSpan(
              //       text: "赤色",
              //       style: TextStyle(fontSize: 15, color: Colors.redAccent)),
              //   TextSpan(
              //     text: "に、提出期限を過ぎると項目が",
              //     style: TextStyle(fontSize: 15),
              //   ),
              //   TextSpan(
              //       text: "黒色",
              //       style: TextStyle(
              //           fontSize: 15,
              //           backgroundColor: Colors.black,
              //           color: Colors.white)),
              //   TextSpan(
              //     text: "になり、期限から３時間以上経過すると消去されます。\n"
              //         "右下のボタンから課題の投稿が行えます。科目名や課題のタイトル、期限と対象の学科と年次を記入して投稿してください。"
              //         "投稿された課題は全ユーザーに共有され、同じ所属のユーザーの掲示板に表示されます。"
              //         "リストの項目を右にスワイプすると編集ボタンが、左にスワイプすると削除ボタンが出現します。"
              //         "ボタンをタップすると編集・削除が行えます。"
