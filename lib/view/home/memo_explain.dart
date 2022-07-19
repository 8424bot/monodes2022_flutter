import 'package:flutter/material.dart';

class MyMemoExplainPage extends StatelessWidget {
  const MyMemoExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text("Memoタブの使い方"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Memoタブは個人的なメモや様々なページへのリンクなどを保存できるページです。\n",
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
                  "images/explain/memo1.jpg",
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
                  text: "をタップすると登録ページへ遷移します。\n以下が登録ページになります。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
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
                  "images/explain/memo2.jpg",
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
                  text:
                      "でタイトルとURL、メモを入力します。入力後、CreateNewボタンをタップすると登録が完了します。\n以下はURL登録後の例です。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
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
                  "images/explain/memo3.png",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                  text:
                      "リストの項目をタップすると詳細を確認でき、URLを登録していた場合はそのページを開くことができます。\nURLの欄に文字を入力することでメモ帳代わりにも使えます。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ])),
            ),
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
                  "images/explain/memo4.png",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                  text:
                      "また、リストの項目を右にスワイプすると編集ボタンが、左にスワイプすると削除ボタンが出現します。\nボタンをタップすると掲示板に投稿されている内容の編集・削除が行えます。",
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
