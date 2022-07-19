//import 'package:flutter/services.dart';
//import 'package:flutter/cupertino.dart';
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'home_explain.dart';
import 'Todo_explain.dart';
import 'school_explain.dart';
import 'memo_explain.dart';
//import 'Thirdpage.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("取扱説明書"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "1.はじめに",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const Text(
                  "\nこのアプリはものづくりデザイン思考実践演習で作成したOIT梅田キャンパス生専用学生生活支援アプリです。",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "課題掲示板には不適切な投稿を防止する機能がありません。良識あるご利用をよろしくお願いします。\n"
                  "本アプリはより多くの人に使ってもらうことでより便利になっていきます。便利だと思ったらお友達に拡散していただけると幸いです。\n",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  "2.機能説明",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const Text(
                  "ライトテーマ、ダークテーマの切り替えは端末の設定に従います。",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MyHomeExplainPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size(120, 120),
                      ),
                      icon: const Icon(Icons.home),
                      label: const Text('Home'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MyTodoExplainPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: const Size(120, 120),
                      ),
                      icon: const Icon(Icons.task_sharp),
                      label: const Text('Todo'),
                    ),
                  ],
                ),
                const Text("\n"),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MySchoolExplainPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: const Size(120, 120),
                      ),
                      icon: const Icon(Icons.school),
                      label: const Text('School'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MyMemoExplainPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        minimumSize: const Size(120, 120),
                      ),
                      icon: const Icon(Icons.menu_book),
                      label: const Text('Memo'),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 30)),
              ],
            ),
          ),
        ));
  }
}
