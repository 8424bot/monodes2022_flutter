//import 'package:flutter/services.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomeExplainPage extends StatelessWidget {
  const MyHomeExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text("Homeタブの使い方"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Homeタブはアプリ起動時のページです。アプリの使い方、自分の所属を確認できます。\n",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ]),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 3,
              )),
              child: const Image(
                image: AssetImage(
                  "images/explain/home1.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "①",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "をタップするとアプリの使い方ページへ遷移できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "②",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text:
                      "で自分の所属を選びます。”Your Status”を自分の所属に設定することでTodoタブにて対象となっている課題を確認できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "③",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "で使いたいタブを選択します。タブはHome、Todo、School、Memoの4つあります。",
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
