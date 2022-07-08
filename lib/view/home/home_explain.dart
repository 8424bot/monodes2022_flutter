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
          title: const Text("Homeタブの使い方"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
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
                  "images/explain/home1.jpg",
                ),
                width: 200,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Homeタブはアプリ起動時のページです。作成者ページやアプリの使い方、自分の所属を確認できます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "①",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "を押すと作成者ページへ飛ぶことができます。",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "②",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text: "を押すとアプリの使い方ページへ飛ぶことができます。\n",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                    text: "③",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                TextSpan(
                  text:
                      "で自分の所属を選びます。”Your Status”を自分の所属に設定することでTodoタブにて対象となっている課題を確認できます。",
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
