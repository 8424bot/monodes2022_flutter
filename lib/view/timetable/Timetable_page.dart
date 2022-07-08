// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names, use_build_context_synchronously

import 'package:app_home_demo/main.dart';
import 'package:app_home_demo/model/db/timetable/timetable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'textinput_page.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('時間割'),
        leading: IconButton(
          icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context, 
                builder: (_) {
                  return WillPopScope(
                    onWillPop: () async => true,
                    child: AlertDialog(
                      title: const Align(
                        alignment: Alignment.center,
                        child: Text('Caution!!'),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Column(
                              children: [
                                const Text('登録内容を全て削除します\n\n本当によろしいですか？'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      child: const Text('No'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Colors.red),
                                      onPressed: () {
                                        _delete();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Yes'),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    )
                  );
                }
              );
            },
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TimeTableInput2()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _delete() {
    for (int i = 0; i <= 6; i++) {
      for (int j = 0; j <= 5; j++) {
        var box = Hive.box('TT');
        String num = i.toString() + j.toString();
        box.put(num, TTable('', '', '未登録', '', '', '', '', '', '', '', ''));
        setState(() {
          
        });
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('削除が完了しました'))
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
      height: MediaQuery.of(context).size.height * (6 / 100),
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

  String _dayandperiod({int raw = 0, int column = 0}) {
    var period = raw + 1;
    if (column == 0) {
      return '月曜$period限';
    } else if (column == 1) {
      return '火曜$period限';
    } else if (column == 2) {
      return '水曜$period限';
    } else if (column == 3) {
      return '木曜$period限';
    } else if (column == 4) {
      return '金曜$period限';
    } else {
      return '土曜$period限';
    }
  }

  Widget subjectContainer({
    int raw = 0,
    int column = 0,
  }) {
    var box = Hive.box('TT');
    var num = raw.toString() + column.toString();
    TTable? val = box.get(num,
        defaultValue: TTable('', '', '未登録', '', '', '', '', '', '', '', ''));
    var Ttsubject = val!.tosubject();
    var Ttteacher = val.toteacher();
    var Ttresult = val.toresult();
    var TturlList = val.tourlList();
    var Ttpartner = val.topartner();
    var urlList = [];
    var dayandperiod = _dayandperiod(raw: raw, column: column);

    return Container(
      height: MediaQuery.of(context).size.height * (14 / 100),
      width: MediaQuery.of(context).size.width * (18 / 100),
      decoration: const BoxDecoration(color: Colors.white),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * (4 / 100),
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(dayandperiod,
                              style: const TextStyle(fontSize: 16)),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * (8 / 100),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  (10 / 100),
                              color: Colors.transparent,
                              child: IconButton(
                                splashColor: Colors.grey,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            RegistInfo(result: [
                                              Ttsubject,
                                              Ttteacher,
                                              TturlList[0],
                                              TturlList[1],
                                              TturlList[2],
                                              TturlList[3],
                                              TturlList[4],
                                              TturlList[5],
                                              TturlList[6],
                                            ]))),
                                  );
                                },
                                icon: const Icon(Icons.info_outline),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  (70 / 100),
                              color: Colors.transparent,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(Ttresult,
                                    style: const TextStyle(fontSize: 16)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  (20 / 100),
                              color: Colors.transparent,
                              child: TextButton(
                                style:
                                    TextButton.styleFrom(primary: Colors.black),
                                onPressed: () async {
                                  var classInfoList = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimeTableInput(
                                              subject: Ttsubject,
                                              teacher: Ttteacher,
                                              urlList: TturlList)));
                                  if (classInfoList == null) {
                                  } else {
                                    if (classInfoList.length == 1) {
                                      setState(() {
                                        Ttsubject = '';
                                        Ttteacher = '';
                                        Ttresult = '未登録';
                                        urlList = ['', '', '', '', '', '', ''];
                                        box.put(
                                            num,
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
                                                ''));
                                        if (Ttpartner != '') {
                                          box.put(
                                              Ttpartner,
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
                                                  ''));
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        Ttsubject = classInfoList[0];
                                        Ttteacher = classInfoList[1];
                                        Ttresult = classInfoList[0] +
                                            ' / ' +
                                            classInfoList[1];
                                        for (int i = 2;
                                            i < classInfoList.length;
                                            i++) {
                                          urlList.add(classInfoList[i]);
                                        }
                                        box.put(
                                            num,
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
                                                Ttpartner));
                                        if (Ttpartner != '') {
                                          var box2 = Hive.box('TT');
                                          TTable? val2 = box2.get(
                                            Ttpartner,
                                            defaultValue: TTable('', '', '未登録',
                                                '', '', '', '', '', '', '', ''),
                                          );
                                          var Ttcompanion2 = val2!.topartner();
                                          box.put(
                                              Ttpartner,
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
                                                  Ttcompanion2));
                                        }
                                      });
                                    }
                                  }
                                  Navigator.pop(context);
                                },
                                child: const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text('変更',
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (int i = 0; i < TturlList.length; i++) ...{
                        if (TturlList[i] != '') ...{
                          bottomSheetContainer(
                            URL: Uri.parse(TturlList[i]),
                            i: i,
                          ),
                        }
                      }
                    ],
                  ),
                ));
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Ttsubject,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Text(
                Ttteacher,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetContainer({
    required Uri URL,
    required int i,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * (9 / 100),
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
                Image.asset('images/app_icons/other.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("その他"),
              }
            ],
          ),
        ),
      ),
    );
  }
}
