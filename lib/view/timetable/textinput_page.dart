// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class TimeTableInput extends StatefulWidget {

  final String subject, teacher;
  final List urlList;
  const TimeTableInput({Key? key, required this.subject, required this.teacher, required this.urlList}) : super(key: key);

  @override
  State<TimeTableInput> createState() => _TimeTableInputState();
}

class _TimeTableInputState extends State<TimeTableInput> {
  final subject_value = TextEditingController();
  final teacher_value = TextEditingController();
  List infoList1 = [];
  List infoList2 = ['', '', '', '', '', '',''];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    if (i==0) {
      subject_value.text = widget.subject;
      teacher_value.text = widget.teacher;
      infoList2 = widget.urlList;
      i++;
    }
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * (80 / 100),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: subject_value,
                  decoration: const InputDecoration(
                    hintText: '授業名を入力してください',
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (80 / 100),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: teacher_value,
                  decoration: const InputDecoration(
                    hintText: '担当教員を入力してください',
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (5 / 100)),
              const Text('URL登録'),
              SizedBox(height: MediaQuery.of(context).size.height * (1 / 100)),
              Container(
                height: MediaQuery.of(context).size.height * (15 / 100),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appButton(filename: 'images/app_icons/classroom.png', id: 0),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(filename: 'images/app_icons/teams.png', id: 1),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(filename: 'images/app_icons/slack.png', id: 2),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(filename: 'images/app_icons/outlook.png', id: 3),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(filename: 'images/app_icons/portal.png', id: 4),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(filename: 'images/app_icons/c-learning.png', id: 5),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(filename: 'images/app_icons/other.png', id: 6),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (5 / 100)),
              SizedBox(
                width: MediaQuery.of(context).size.width * (40 / 100),
                child: ElevatedButton(
                  onPressed: () {
                    if (subject_value.text != '') {
                      if (teacher_value.text != '') {
                        infoList1 = [subject_value.text, teacher_value.text];
                        infoList1.addAll(infoList2);
                        Navigator.of(context).pop(infoList1);
                      }
                    }
                  },
                  child: const Text('登録'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (1 / 100)),
              SizedBox(
                width: MediaQuery.of(context).size.width * (40 / 100),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (1 / 100)),
              SizedBox(
                width: MediaQuery.of(context).size.width * (40 / 100),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop([' ']);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('登録情報削除'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appButton({required String filename, required int id}) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () async {
        var url = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TimeTableUrlInput(url: infoList2[id])),
        );
        setState(() {
          infoList2[id] = url;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * (12 / 100),
        width: MediaQuery.of(context).size.width * (12 / 100),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Image.asset(filename),
      ),
    );
  }
}

class TimeTableUrlInput extends StatefulWidget {

  final String url;
  const TimeTableUrlInput({Key? key, required this.url}) : super(key: key);

  @override
  State<TimeTableUrlInput> createState() => _TimeTableUrlInputState();
}

class _TimeTableUrlInputState extends State<TimeTableUrlInput> {
  final url_value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    url_value.text = widget.url;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * (80 / 100),
              child: TextField(
                textAlign: TextAlign.center,
                controller: url_value,
                decoration: const InputDecoration(
                  hintText: "URLを入力してください",
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * (5 / 100)),
            SizedBox(
              width: MediaQuery.of(context).size.width * (40 / 100),
              child: ElevatedButton(
                onPressed: () {
                  if (url_value.text != '') {
                    Navigator.of(context).pop(url_value.text);
                  }
                },
                child: const Text('登録'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * (1 / 100)),
            SizedBox(
              width: MediaQuery.of(context).size.width * (40 / 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('');
                },
                child: const Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistInfo extends StatelessWidget {
  RegistInfo({Key? key, required this.result}) : super(key: key);
  List result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.topLeft,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * (20 / 100)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < result.length; i++) ...{
                    if (result[i] != '') ...{
                      if (i == 0) ...{
                        Text('授業名: ' + result[i]),
                      } else if (i == 1) ...{
                        Text('担当教員: ' + result[i]),
                      } else if (i == 2) ...{
                        Text('Classroom: ' + result[i]),
                      } else if (i == 3) ...{
                        Text('Teams: ' + result[i]),
                      } else if (i == 4) ...{
                        Text('Slack: ' + result[i]),
                      } else if (i == 5) ...{
                        Text('Outlook: ' + result[i]),
                      } else if (i == 6) ...{
                        Text('OIT portal: ' + result[i]),
                      } else if (i == 7) ...{
                        Text('OIT C-Learning: ' + result[i]),
                      } else if (i == 8) ...{
                        Text('Other: ' + result[i]),
                      }
                    }
                  }
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
