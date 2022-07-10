import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySchoolExplainPage extends StatelessWidget {
  const MySchoolExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("Schoolタブの使い方"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "schoolタブは自分の時間割や、時間割に基づいた情報を保存することができるページです。",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ]),
                )),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/school1.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "①",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると時間割登録ページへ遷移します。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "②",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると登録している時間割情報を一括削除できます。\n以下が時間割登録ページになります。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/school2.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "③",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "で登録したい科目名と担当教員を設定できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "④",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "で登録したい科目が何曜日の何時限目にあるのかを設定できます。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: "\nまた、右にある＋ボタンを活用することで同じ科目を別の曜日、時限に一括設定できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "⑤",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text:
                      "で登録する科目に関連するURLを登録することができます。以上の設定が完了したら「登録」ボタンをタップして時間割に反映させることができます。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: "\n以下は登録した時間割の例です。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/school3.png",
                ),
                width: 200,
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text:
                          "このページでは、時間割をタップすることで登録した内容の変更や登録したURLのページに飛ぶことができます。",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ]),
                )),
            Container(
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              //alignment: Alignment.topLeft,
              child: const Image(
                image: AssetImage(
                  "images/explain/school4.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "⑥",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると登録した科目の詳細情報を見ることができます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "⑦",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "で登録した科目名や担当教員などの変更ができます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "⑧",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップすると登録したURLのページに飛ぶことができます。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
          ]),
        ));
  }
}

 //         "\n\n3.Schoolタブ\n"
              //         "自分の時間割を保存することができるページです。"
              //         "コマをタップすると登録された情報が表示されます。”登録情報変更”をタップすると情報の登録と変更を行えます。"
              //         "登録ページでは授業名や教員情報のほか、各種サービスへのURLをペーストすると登録できます。URLを登録したサービスは時間割をタップするとすばやくアクセスできるようになります。"
