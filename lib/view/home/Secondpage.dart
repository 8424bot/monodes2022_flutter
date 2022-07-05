import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("取扱説明書"),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(children: const [
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
                "これはものづくりデザイン思考実践演習Ⅰで作成したOIT梅田キャンパス生専用学生生活支援アプリです\n"
                "不具合やご意見・ご要望等ありましたら作成者までご連絡ください。\n",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "2.機能説明",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "\n1.homeタブ\n"
                      "アプリ起動時のページです。アプリの使い方などを確認できます。"
                      "”Your Status”を自分の所属に設定することでTodoタブにて対象となっている課題を確認できます。"
                      "\n\n2.Todoタブ\n"
                      "ユーザー全員で共有の課題掲示板です。課題情報の投稿と自分の学科・学年に割りあてられた課題情報の確認ができます。"
                      "課題の提出期限が１日以内に迫ると文字が",
                  style: TextStyle(fontSize: 15),
                ),
                TextSpan(
                    text: "赤色",
                    style: TextStyle(fontSize: 15, color: Colors.redAccent)),
                TextSpan(
                  text: "に、提出期限を過ぎると項目が",
                  style: TextStyle(fontSize: 15),
                ),
                TextSpan(
                    text: "黒色",
                    style: TextStyle(
                        fontSize: 15,
                        backgroundColor: Colors.black,
                        color: Colors.white)),
                TextSpan(
                  text: "になり、期限から３時間以上経過すると消去されます。\n"
                      "右下のボタンから課題の投稿が行えます。科目名や課題のタイトル、期限と対象の学科と年次を記入して投稿してください。"
                      "投稿された課題は全ユーザーに共有され、同じ所属のユーザーの掲示板に表示されます。"
                      "リストの項目を右にスワイプすると編集ボタンが、左にスワイプすると削除ボタンが出現します。"
                      "ボタンをタップすると編集・削除が行えます。"
                      "\n\n3.Schoolタブ\n"
                      "自分の時間割を保存することができるページです。"
                      "コマをタップすると登録された情報が表示されます。”登録情報変更”をタップすると情報の登録と変更を行えます。"
                      "登録ページでは授業名や教員情報のほか、各種サービスへのURLをペーストすると登録できます。URLを登録したサービスは時間割をタップするとすばやくアクセスできるようになります。"
                      "\n\n4.Linksタブ\n",
                  style: TextStyle(fontSize: 15),
                ),
                TextSpan(
                  text: "個人的なメモや様々なページへのリンクなどを保存できるページです。右下のボタンをタップすると登録ができます。"
                      "リストの項目をタップすると詳細を確認でき、URLを登録していた場合はそのページを開くことができます。URLの欄に文字を入力することでメモ帳代わりにも使えます。"
                      "項目を左にスライドすると編集と削除が行えます。\n",
                  style: TextStyle(fontSize: 15),
                ),
              ])),
              Text(
                "3.おねがい",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                "\n課題掲示板には不適切な投稿を防止する機能がありません。良識ある利用をよろしくお願いします。\n"
                "本アプリはより多くの人に使ってもらうことでより便利になっていきます。便利だと思ったらお友達に拡散していただけると幸いです。",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ])));
  }
}
