// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names

import 'package:app_home_demo/main.dart';
import 'package:app_home_demo/model/db/timetable/timetable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'textinput_page.dart';

class Timateble5 extends StatefulWidget {
  const Timateble5({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _TimatebleState createState() => _TimatebleState();
}

class _TimatebleState extends State<Timateble5> {
  final double _saturdayWidth = 10;
  final double _sixthRowHeight = 8;
  final double _seventhRowHeight = 8;
  String url = 'https://picsum.photos/200';
    
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
              subjectTableRow(period: '6', raw: 5, height: _sixthRowHeight),
              subjectTableRow(period: '7', raw: 6, height: _seventhRowHeight),
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
        dayContainer(width: _saturdayWidth, day: '土'),
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

  TableRow subjectTableRow({double height = 14, String period = '', int raw = 0}) {
    return TableRow(
      children: <Widget>[
        periodContainer(height: height, period: period),
        subjectContainer(height: height, raw: raw, column: 0),
        subjectContainer(height: height, raw: raw, column: 1),
        subjectContainer(height: height, raw: raw, column: 2),
        subjectContainer(height: height, raw: raw, column: 3),
        subjectContainer(height: height, raw: raw, column: 4),
        subjectContainer(height: height, width: 10, raw: raw, column: 5),
      ],
    );
  }

  Widget periodContainer({double height = 14, String period = ''}) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * (height / 100),
      width: MediaQuery.of(context).size.width * (10 / 100),
      color: Colors.lightBlue[100],
      child: Text(period),
    );
  }
  
  Widget subjectContainer({
    required double height,
    double width = 18, 
    int raw = 0, 
    int column = 0,
  }) {
    var box = Hive.box(TableBoxName);
    var num = raw.toString() + column.toString();
    TTable? val = box.get(num, defaultValue: TTable('', '', '未登録', '', '', '', '', '', '', ''));
    var Ttsubject = val!.tosubject();
    var Ttteacher = val.toteacher();
    var Ttresult = val.toresult();
    var urlList = [];
    var addList = [];

    return Container(
      height: MediaQuery.of(context).size.height * (height / 100),
      width: MediaQuery.of(context).size.width * (width / 100),
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
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * (10 / 100),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              splashColor: Colors.grey,
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: ((context) => RegistInfo(result: [Ttsubject, Ttteacher]))),
                                );
                              },
                              icon: const Icon(Icons.info_outline),
                            ),
                            Text(Ttresult, textAlign: TextAlign.center,),
                            TextButton(
                              style:  TextButton.styleFrom(primary: Colors.black),
                              onPressed: () async {
                                var classInfoList = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TimeTableInput())
                                );
                                if (classInfoList.length == 1) {
                                  setState(() {
                                    Ttsubject = '';
                                    Ttteacher = '';
                                    Ttresult = '未登録';
                                    urlList = [];
                                    for (int j = 0; j < 7; j++) {
                                      if (j < urlList.length) {
                                        addList.add(urlList[j]);
                                      } else {
                                        addList.add('');
                                      }
                                    }
                                    box.put(num, TTable(
                                      Ttsubject, Ttteacher, Ttresult, 
                                      addList[0], addList[1], addList[2], 
                                      addList[3], addList[4], addList[5], addList[6]
                                    ));
                                  });
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    Ttsubject = classInfoList[0];
                                    Ttteacher = classInfoList[1];
                                    Ttresult = classInfoList[0] + ' / ' + classInfoList[1];
                                    for (int i = 2; i < classInfoList.length; i++) {
                                      urlList.add(classInfoList[i]);
                                    }
                                    for (int j = 0; j < 7; j++) {
                                      if (j < urlList.length) {
                                        addList.add(urlList[j]);
                                      } else {
                                        addList.add('');
                                      }
                                    }
                                    box.put(num, TTable(
                                      Ttsubject, Ttteacher, Ttresult, 
                                      addList[0], addList[1], addList[2], 
                                      addList[3], addList[4], addList[5], addList[6]
                                    ));
                                  });
                                }
                                print(urlList[0]);
                                print(urlList[1]);
                                print(urlList[2]);
                                print(urlList[3]);
                                print(urlList[4]);
                                print(urlList[5]);
                                print(urlList[6]);
                                Navigator.pop(context);
                              },
                              child: const Text('登録情報変更'),
                            ),
                          ],
                        ),
                      ),
                      for (int i = 0; i < urlList.length; i++) ...{
                        if (urlList[i] != '') ...{
                          bottomSheetContainer(
                            raw: raw,
                            column: column,
                            URL: Uri.parse(urlList[i]),
                            i: i,
                          ),
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
              Text(Ttsubject),
              Text(Ttteacher)
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetContainer({
    required int raw,
    required int column,
    required Uri URL,
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
            if (await canLaunchUrl(URL)) {
              await launchUrl(URL);
            } else {}
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (i == 0) ...{
                Image.asset('images/app_icons/classroom.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Classroom"),
              } else if (i == 1) ...{
                Image.asset('images/app_icons/teams.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Teams"),
              } else if (i == 2) ...{
                Image.asset('images/app_icons/slack.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Slack"),
              } else if (i == 3) ...{
                Image.asset('images/app_icons/outlook.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Outlook"),
              } else if (i == 4) ...{
                Image.asset('images/app_icons/portal.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("OIT Portal"),
              } else if (i == 5) ...{
                Image.asset('images/app_icons/c-learning.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("OIT C-Learning"),
              } else if (i == 6) ...{
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