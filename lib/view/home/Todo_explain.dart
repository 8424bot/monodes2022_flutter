//import 'package:flutter/services.dart';
//import 'package:flutter/cupertino.dart';
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTodoExplainPage extends StatelessWidget {
  const MyTodoExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text("Todoタブの使い方"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text:
                          "Todoタブはユーザー全員で共有可能な課題掲示板です。課題情報の投稿と自分の学科・学年に割りあてられた課題情報の確認ができます。\n",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ]),
                )),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/Todo1.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "①",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると課題の投稿ページへ遷移します。\n以下が課題投稿ページになります。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/Todo2.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "②",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると登録したい課題の期日を設定できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "③",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると登録したい課題の締切時刻を設定できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "④",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "で登録したい課題の対象の学科と年次を設定できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "⑤",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text:
                      "で登録したい課題の科目名と課題の内容を設定できます。\nすべての内容の設定が完了したら「投稿」ボタンを押して登録した課題を掲示板に投稿します。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text:
                      "\n投稿された課題は全ユーザーに共有され、同じ所属のユーザーの掲示板に表示されます。\n以下が課題を投稿した掲示板の画面の例です。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/Todo3.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                  text: "登録した課題の提出期限が１日（24時間）以内に迫ると文字が",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "赤色",
                    style: TextStyle(fontSize: 17, color: Colors.redAccent)),
                TextSpan(
                  text: "に、提出期限を過ぎると項目が",
                  style: TextStyle(fontSize: 17),
                ),
                TextSpan(
                    text: "黒色",
                    style: TextStyle(
                        fontSize: 17,
                        backgroundColor: Colors.black,
                        color: Colors.white)),
                TextSpan(
                  text: "になり、期限から３時間以上経過すると自動的に消去されます。\nまた、",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "⑥",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると通知設定のページへ遷移します。"
                      "ここで課題締切の～日前、～時間前に通知を送るかを設定できます。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/Todo4.png",
                ),
                width: 200,
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "通知を設定すると上の画像の様に通知のマークが変わります。",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ]),
                )),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/Todo5.png",
                ),
                width: 200,
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text:
                          "また、リストの項目を右にスワイプすると編集ボタンが、左にスワイプすると削除ボタンが出現します。\nボタンをタップすると掲示板に投稿されている内容の編集・削除が行えます。",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ]),
                )),
          ]),
        ));
  }
}
