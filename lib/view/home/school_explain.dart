import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySchoolExplainPage extends StatelessWidget {
  const MySchoolExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("説明3"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                child: const Text.rich(TextSpan(children: [
              TextSpan(
                text: "　準備中・・・\n",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ])))
          ]),
        ));
  }
}

 //         "\n\n3.Schoolタブ\n"
              //         "自分の時間割を保存することができるページです。"
              //         "コマをタップすると登録された情報が表示されます。”登録情報変更”をタップすると情報の登録と変更を行えます。"
              //         "登録ページでは授業名や教員情報のほか、各種サービスへのURLをペーストすると登録できます。URLを登録したサービスは時間割をタップするとすばやくアクセスできるようになります。"
