// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'timetable_info.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

List result = [
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
  [
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', ''],
    ['', '']
  ],
];

List subject = [
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
];

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        constrained: false,
        child: Container(
          alignment: Alignment.center,
          child: Table(
            border: TableBorder.all(),
            defaultColumnWidth: const IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              dayofweekTableRow(),
              subjectTableRow(period: '1', raw: 0),
              subjectTableRow(period: '2', raw: 1),
              subjectTableRow(period: '3', raw: 2),
              subjectTableRow(period: '4', raw: 3),
              subjectTableRow(period: '5', raw: 4),
              subjectTableRow(period: '6', raw: 5),
              subjectTableRow(period: '7', raw: 6),
            ],
          ),
        ),
      ),
    );
  }

  TableRow dayofweekTableRow() {
    return TableRow(
      children: <Widget>[
        dayContainer(width: 10),
        dayContainer(day: '月'),
        dayContainer(day: '火'),
        dayContainer(day: '水'),
        dayContainer(day: '木'),
        dayContainer(day: '金'),
        dayContainer(day: '土'),
      ],
    );
  }

  Widget dayContainer({double width = 18, String day = ''}) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * (10 / 100),
      width: MediaQuery.of(context).size.width * (width / 100),
      color: Colors.lightBlue,
      child: Text(day),
    );
  }

  TableRow subjectTableRow({String period = '', int raw = 0}) {
    return TableRow(
      children: <Widget>[
        periodContainer(period: period),
        subjectContainer(raw: raw, column: 0),
        subjectContainer(raw: raw, column: 1),
        subjectContainer(raw: raw, column: 2),
        subjectContainer(raw: raw, column: 3),
        subjectContainer(raw: raw, column: 4),
        subjectContainer(raw: raw, column: 5),
      ],
    );
  }

  Widget periodContainer({String period = ''}) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * (14 / 100),
      width: MediaQuery.of(context).size.width * (10 / 100),
      color: Colors.lightBlue[100],
      child: Text(period),
    );
  }

  Widget subjectContainer({int raw = 0, int column = 0}) {
    return Container(
      height: MediaQuery.of(context).size.height * (14 / 100),
      width: MediaQuery.of(context).size.width * (18 / 100),
      decoration: const BoxDecoration(color: Colors.white),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.lightBlue[50],
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * (10 / 100),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              splashColor: Colors.grey,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegistInfo(
                                      result: result[raw][column],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.info_outline),
                            ),
                            Text(subject[raw][column],
                                textAlign: TextAlign.center),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              onPressed: () async {
                                var classInfoList = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TimeTableInput(),
                                  ),
                                );
                                setState(() {
                                  result[raw][column] = ['', ''];
                                  result[raw][column][0] = classInfoList[0];
                                  result[raw][column][1] = classInfoList[1];
                                  for (int i = 2;
                                      i < (classInfoList.length);
                                      i++) {
                                    result[raw][column].add(classInfoList[i]);
                                  }
                                  subject[raw][column] = result[raw][column]
                                          [0] +
                                      ' / ' +
                                      result[raw][column][1];
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                '登録情報変更',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (int i = 0; i < result[raw][column].length; i++) ...{
                        if (i != 0 && i != 1) ...{
                          if (result[raw][column][i] != '') ...{
                            bottomSheetContainer(
                              raw: raw,
                              column: column,
                              i: i,
                            ),
                          }
                        }
                      }
                    ],
                  ),
                );
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(result[raw][column][0], textAlign: TextAlign.center),
              Text(result[raw][column][1], textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetContainer({
    required int raw,
    required int column,
    required int i,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * (12 / 100),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () async {
            if (await canLaunch(result[raw][column][i])) {
              await launch(
                result[raw][column][i],
                forceSafariVC: false,
                forceWebView: false,
              );
            } else {
              throw 'Could not launch';
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (i == 2) ...{
                Image.asset('images/app_icons/classroom.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Classroom"),
              } else if (i == 3) ...{
                Image.asset('images/app_icons/teams.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Teams"),
              } else if (i == 4) ...{
                Image.asset('images/app_icons/slack.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Slack"),
              } else if (i == 5) ...{
                Image.asset('images/app_icons/outlook.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Outlook"),
              } else if (i == 6) ...{
                Image.asset('images/app_icons/portal.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("OIT Portal"),
              } else if (i == 7) ...{
                Image.asset('images/app_icons/c-learning.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("OIT C-Learning"),
              } else if (i == 8) ...{
                Image.asset('images/app_icons/internet.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Other"),
              }
            ],
          ),
        ),
      ),
    );
  }
}
