import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_explain.dart';
import 'Todo_explain.dart';
import 'school_explain.dart';
import 'memo_explain.dart';
import 'Thirdpage.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("取扱説明書"),
        ),
        body: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "1.はじめに",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                "\n現在はテスト版です\n",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "　これはものづくりデザイン思考実践演習Ⅰで作成したOIT梅田キャンパス生専用学生生活支援アプリです。\n"
                "不具合やご意見・ご要望等ありましたら作成者までご連絡ください。",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "課題掲示板には不適切な投稿を防止する機能がありません。良識ある利用をよろしくお願いします。\n"
                "本アプリはより多くの人に使ってもらうことでより便利になっていきます。便利だと思ったらお友達に拡散していただけると幸いです。",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "2.機能説明",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
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
                      minimumSize: Size(120, 120),
                    ),
                    icon: Icon(Icons.home),
                    label: Text('home'),
                  ),
                  SizedBox(
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
                      minimumSize: Size(120, 120),
                    ),
                    icon: Icon(Icons.task_sharp),
                    label: Text('Todo'),
                  ),
                ],
              ),
              Text("\n"),
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
                      minimumSize: Size(120, 120),
                    ),
                    icon: Icon(Icons.school),
                    label: Text('school'),
                  ),
                  SizedBox(
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
                      minimumSize: Size(120, 120),
                    ),
                    icon: Icon(Icons.menu_book),
                    label: Text('memo'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
