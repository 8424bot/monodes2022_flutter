// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:app_home_demo/main.dart';
import 'package:app_home_demo/model/db/timetable/timetable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimeTableInput extends StatefulWidget {
  final String subject, teacher;
  final List urlList;
  const TimeTableInput(
      {Key? key,
      required this.subject,
      required this.teacher,
      required this.urlList})
      : super(key: key);

  @override
  State<TimeTableInput> createState() => _TimeTableInputState();
}

class _TimeTableInputState extends State<TimeTableInput> {
  final subject_value = TextEditingController();
  final teacher_value = TextEditingController();
  List infoList1 = [];
  List infoList2 = ['', '', '', '', '', '', ''];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      subject_value.text = widget.subject;
      teacher_value.text = widget.teacher;
      infoList2 = widget.urlList;
      i++;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('授業登録'),
      ),
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
                    appButton(
                        filename: 'images/app_icons/classroom_button.png',
                        id: 0),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/teams_button.png', id: 1),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/slack_button.png', id: 2),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/outlook_button.png', id: 3),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/portal_button.png', id: 4),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/c-learning_button.png',
                        id: 5),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/other_button.png', id: 6),
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
          MaterialPageRoute(
              builder: (context) =>
                  TimeTableUrlInput(url: infoList2[id], num: 1)),
        );
        setState(() {
          if (url == null) {
          } else {
            infoList2[id] = url;
          }
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * (12 / 100),
        width: MediaQuery.of(context).size.width * (12 / 100),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: imageAsset(filename: filename, id: id),
      ),
    );
  }

  Widget imageAsset({required String filename, required int id}) {
    if (infoList2[id] == '') {
      return Image.asset(filename,
          color: const Color.fromARGB(80, 40, 40, 40),
          colorBlendMode: BlendMode.srcATop);
    } else {
      return Image.asset(filename);
    }
  }
}

class TimeTableUrlInput extends StatefulWidget {
  final String url;
  final int num;
  const TimeTableUrlInput({Key? key, required this.url, required this.num})
      : super(key: key);

  @override
  State<TimeTableUrlInput> createState() => _TimeTableUrlInputState();
}

class _TimeTableUrlInputState extends State<TimeTableUrlInput> {
  final url_value = TextEditingController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      url_value.text = widget.url;
      i++;
    }
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
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
            ),
            if (widget.num == 1) ...{
              SizedBox(
                width: MediaQuery.of(context).size.width * (40 / 100),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop('');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('登録情報削除'),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}

class RegistInfo extends StatefulWidget {
  RegistInfo({Key? key, required this.result}) : super(key: key);
  List result;

  @override
  State<RegistInfo> createState() => _RegistInfoState();
}

class _RegistInfoState extends State<RegistInfo> {
  @override
  Widget build(BuildContext context) {
    if ((widget.result[0] == '') && (widget.result[1] == '')) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('登録情報'),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * (20 / 100),
            width: double.infinity,
            color: Colors.transparent,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('未登録', style: TextStyle(fontSize: 48)),
                  Text('授業が登録されていません', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('登録情報'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * (2 / 100)),
              Container1(text1: widget.result[0], text2: widget.result[1]),
              SizedBox(height: MediaQuery.of(context).size.height * (2 / 100)),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * (7 / 100),
                width: double.infinity,
                color: Colors.lightBlue[50],
                child: Column(
                  children: const [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('登録URL', style: TextStyle(fontSize: 20)),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('タップして詳細確認', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (2 / 100)),
              for (int i = 2; i < widget.result.length; i++) ...{
                if (widget.result[i] != '') ...{
                  if (i == 2) ...{
                    Container2(
                      title: 'Classroom',
                      url: widget.result[i],
                      filename: 'images/app_icons/classroom.png',
                    ),
                  } else if (i == 3) ...{
                    Container2(
                      title: 'Teams',
                      url: widget.result[i],
                      filename: 'images/app_icons/teams.png',
                    ),
                  } else if (i == 4) ...{
                    Container2(
                      title: 'Slack',
                      url: widget.result[i],
                      filename: 'images/app_icons/slack.png',
                    ),
                  } else if (i == 5) ...{
                    Container2(
                      title: 'Outlook',
                      url: widget.result[i],
                      filename: 'images/app_icons/outlook.png',
                    ),
                  } else if (i == 6) ...{
                    Container2(
                      title: 'OIT Portal',
                      url: widget.result[i],
                      filename: 'images/app_icons/portal.png',
                    ),
                  } else if (i == 7) ...{
                    Container2(
                      title: 'OIT C-Learning',
                      url: widget.result[i],
                      filename: 'images/app_icons/c-learning.png',
                    ),
                  } else if (i == 8) ...{
                    Container2(
                      title: 'その他',
                      url: widget.result[i],
                      filename: 'images/app_icons/other.png',
                    ),
                  }
                }
              }
            ],
          ),
        ),
      );
    }
  }

  Widget Container1({required String text1, required String text2}) {
    return Container(
      height: MediaQuery.of(context).size.height * (10 / 100),
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.all(10),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text('授業名: ' + text1 + '\n' + '担当教員: ' + text2,
            style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget Container2(
      {required String title, required String url, required String filename}) {
    return Container(
      height: MediaQuery.of(context).size.height * (8 / 100),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () async {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('登録されているURL'),
                    content: Text(url),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('確認'),
                      )
                    ],
                  );
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(filename),
              SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeTableInput2 extends StatefulWidget {
  const TimeTableInput2({Key? key}) : super(key: key);

  @override
  State<TimeTableInput2> createState() => _TimeTableInput2State();
}

class _TimeTableInput2State extends State<TimeTableInput2> {
  final subject_value = TextEditingController();
  final teacher_value = TextEditingController();
  int number = 0;
  List<String> selectedColumnValue = ['0', '0'];
  List<String> selectedRawValue = ['0', '0'];
  List urlList = ['', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('TT');
    var num = '00';
    TTable? val = box.get(
      num,
      defaultValue: TTable('', '', '未登録', '', '', '', '', '', '', '', ''),
    );
    var Ttsubject = val!.tosubject();
    var Ttteacher = val.toteacher();
    var Ttresult = val.toresult();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('授業登録'),
      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (50 / 100),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: (number + 1),
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: SelectButton(number: index),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * (5 / 100)),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {
                        if (number < 1) {
                          setState(() {
                            number++;
                          });
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
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
                    appButton(
                        filename: 'images/app_icons/classroom_button.png',
                        id: 0),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/teams_button.png', id: 1),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/slack_button.png', id: 2),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/outlook_button.png', id: 3),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/portal_button.png', id: 4),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/c-learning_button.png',
                        id: 5),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 100)),
                    appButton(
                        filename: 'images/app_icons/other_button.png', id: 6),
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
                        Ttsubject = subject_value.text;
                        Ttteacher = teacher_value.text;
                        Ttresult =
                            subject_value.text + ' / ' + teacher_value.text;
                        if (number == 0) {
                          box.put(
                            selectedRawValue[0] + selectedColumnValue[0],
                            TTable(
                                Ttsubject,
                                Ttteacher,
                                Ttresult,
                                urlList[0],
                                urlList[1],
                                urlList[2],
                                urlList[3],
                                urlList[4],
                                urlList[5],
                                urlList[6],
                                ''),
                          );
                        } else if (number == 1) {
                          box.put(
                            selectedRawValue[0] + selectedColumnValue[0],
                            TTable(
                                Ttsubject,
                                Ttteacher,
                                Ttresult,
                                urlList[0],
                                urlList[1],
                                urlList[2],
                                urlList[3],
                                urlList[4],
                                urlList[5],
                                urlList[6],
                                selectedRawValue[1] + selectedColumnValue[1]),
                          );
                          box.put(
                            selectedRawValue[1] + selectedColumnValue[1],
                            TTable(
                                Ttsubject,
                                Ttteacher,
                                Ttresult,
                                urlList[0],
                                urlList[1],
                                urlList[2],
                                urlList[3],
                                urlList[4],
                                urlList[5],
                                urlList[6],
                                selectedRawValue[0] + selectedColumnValue[0]),
                          );
                        }
                        Navigator.of(context).pop();
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
            ],
          ),
        ),
      ),
    );
  }

  Widget SelectButton({required number}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('曜日: '),
        SizedBox(
          width: MediaQuery.of(context).size.width * (10 / 100),
          child: DropdownButton(
            items: const [
              DropdownMenuItem(value: '0', child: Text('月')),
              DropdownMenuItem(value: '1', child: Text('火')),
              DropdownMenuItem(value: '2', child: Text('水')),
              DropdownMenuItem(value: '3', child: Text('木')),
              DropdownMenuItem(value: '4', child: Text('金')),
              DropdownMenuItem(value: '5', child: Text('土')),
            ],
            onChanged: (String? value) {
              setState(() {
                selectedColumnValue[number] = value!;
              });
            },
            value: selectedColumnValue[number],
            isExpanded: true,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
        const Text('時限: '),
        SizedBox(
          width: MediaQuery.of(context).size.width * (10 / 100),
          child: DropdownButton(
            items: const [
              DropdownMenuItem(value: '0', child: Text('1')),
              DropdownMenuItem(value: '1', child: Text('2')),
              DropdownMenuItem(value: '2', child: Text('3')),
              DropdownMenuItem(value: '3', child: Text('4')),
              DropdownMenuItem(value: '4', child: Text('5')),
              DropdownMenuItem(value: '5', child: Text('6')),
              DropdownMenuItem(value: '6', child: Text('7')),
            ],
            onChanged: (String? value) {
              setState(() {
                selectedRawValue[number] = value!;
              });
            },
            value: selectedRawValue[number],
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Widget appButton({required String filename, required int id}) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () async {
        var url = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TimeTableUrlInput(url: urlList[id], num: 2)),
        );
        if (url == null) {
        } else {
          setState(() {
            urlList[id] = url;
          });
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.width * (12 / 100),
        width: MediaQuery.of(context).size.width * (12 / 100),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: imageAsset(filename: filename, id: id),
      ),
    );
  }

  Widget imageAsset({required String filename, required int id}) {
    if (urlList[id] == '') {
      return Image.asset(filename,
          color: const Color.fromARGB(80, 40, 40, 40),
          colorBlendMode: BlendMode.srcATop);
    } else {
      return Image.asset(filename);
    }
  }
}
