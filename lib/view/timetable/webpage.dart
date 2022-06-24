import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({Key? key}) : super(key: key);

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Google Class Room"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: const Text("Classroom クラスページ"),
            tileColor: const Color.fromARGB(255, 71, 182, 233),
            //URLを開く処理
            onTap: () async {
              const url = 'https://classroom.google.com/';
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Microsoft Teams"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: const Text("Teams トップページ"),
            tileColor: const Color.fromARGB(255, 71, 182, 233),
            //URLを開く処理
            onTap: () async {
              const url = 'https://teams.microsoft.com/';
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: const Text("slack ワークスペース選択ページ"),
            tileColor: const Color.fromARGB(255, 98, 188, 230),
            //URLを開く処理
            onTap: () async {
              const url = 'https://slack.com/get-started#/landing//';
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class OutlookPage extends StatefulWidget {
  String name; 
  OutlookPage(this.name, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<OutlookPage> createState() => _OutlookPageState(name);
}

class _OutlookPageState extends State<OutlookPage> {
  String name;
  _OutlookPageState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Microsoft Outlook"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: const Text("Outlook 受信トレイ"),
            tileColor: const Color.fromARGB(255, 71, 182, 233),
            onTap: () async {
              const url = 'https://outlook.office365.com/';
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: const Text("Outlook 検索結果"),
            tileColor: const Color.fromARGB(255, 136, 202, 233),
            onTap: () async {
              String url = 'https://outlook.office365.com/mail/serch/results/mail/$name';
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}

