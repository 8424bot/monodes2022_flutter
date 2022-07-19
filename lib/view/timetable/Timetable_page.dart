// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names, use_build_context_synchronously, sized_box_for_whitespace

import 'package:app_home_demo/model/db/timetable/timetable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'textinput_page.dart';
import 'package:app_home_demo/view/home/school_explain.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  double periodWidth = 8.2;
  double subjectWidth = 15.3;
  double dayHeight = 5;
  double subjectHeight = 14.5;

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
    Color borderColor = Colors.black;
    Color dayColor = Colors.lightBlue;
    Color timeColor = const Color.fromARGB(255, 179, 229, 252);
    Color sheetColor = const Color.fromARGB(255, 238, 238, 238);
    if (platformBrightness == Brightness.dark) {
      borderColor = Colors.grey;
      dayColor = const Color.fromARGB(255, 40, 40, 40);
      timeColor = const Color.fromARGB(255, 70, 70, 70);
      sheetColor = const Color.fromARGB(255, 70, 70, 70);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('時間割'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return WillPopScope(
                        onWillPop: () async => true,
                        child: AlertDialog(
                            title: const Align(
                              alignment: Alignment.center,
                              child: Text('操作説明'),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                          '＋アイコン又は登録したい曜日時間のパネルをタッチして授業の登録ができます。\n詳しい説明は右下の「詳しく見る」ボタンから参照してください。'),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Builder(builder: (context) {
                                            return ElevatedButton(
                                              child: const Text('閉じる'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            );
                                          }),
                                          Builder(builder: (context) {
                                            return ElevatedButton(
                                              child: const Text('詳しく見る'),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MySchoolExplainPage()));
                                              },
                                            );
                                          }),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )));
                  });
            },
          )
        ],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Builder(builder: (context) {
                                          return TextButton(
                                            child: const Text('No'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          );
                                        }),
                                        Builder(builder: (context) {
                                          return TextButton(
                                            child: const Text('Yes'),
                                            onPressed: () {
                                              _delete();
                                              Navigator.pop(context);
                                            },
                                          );
                                        }),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )));
                });
          },
        ),
      ),
      body: InteractiveViewer(
        constrained: false,
        child: Container(
          alignment: Alignment.center,
          child: Table(
            border: TableBorder.all(color: borderColor),
            defaultColumnWidth: const IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              dayofweekTableRow(dayColor: dayColor),
              subjectTableRow(
                  period: '1',
                  raw: 0,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
              subjectTableRow(
                  period: '2',
                  raw: 1,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
              subjectTableRow(
                  period: '3',
                  raw: 2,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
              subjectTableRow(
                  period: '4',
                  raw: 3,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
              subjectTableRow(
                  period: '5',
                  raw: 4,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
              subjectTableRow(
                  period: '6',
                  raw: 5,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
              subjectTableRow(
                  period: '7',
                  raw: 6,
                  timeColor: timeColor,
                  sheetColor: sheetColor),
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
        box.put(num, TTable('', '', '', '', '', '', '', '', '', '', ''));
        setState(() {});
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('削除が完了しました')));
  }

  TableRow dayofweekTableRow({required Color dayColor}) {
    return TableRow(
      children: <Widget>[
        dayContainer(height: dayHeight, width: periodWidth, dayColor: dayColor),
        dayContainer(
            height: dayHeight,
            width: subjectWidth,
            day: '月',
            dayColor: dayColor),
        dayContainer(
            height: dayHeight,
            width: subjectWidth,
            day: '火',
            dayColor: dayColor),
        dayContainer(
            height: dayHeight,
            width: subjectWidth,
            day: '水',
            dayColor: dayColor),
        dayContainer(
            height: dayHeight,
            width: subjectWidth,
            day: '木',
            dayColor: dayColor),
        dayContainer(
            height: dayHeight,
            width: subjectWidth,
            day: '金',
            dayColor: dayColor),
        dayContainer(
            height: dayHeight,
            width: subjectWidth,
            day: '土',
            dayColor: dayColor),
      ],
    );
  }

  Widget dayContainer(
      {required double height,
      required double width,
      String day = '',
      required Color dayColor}) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * (height / 100),
      width: MediaQuery.of(context).size.width * (width / 100),
      color: dayColor,
      child: Text(day),
    );
  }

  TableRow subjectTableRow(
      {String period = '',
      int raw = 0,
      required Color timeColor,
      required Color sheetColor}) {
    return TableRow(
      children: <Widget>[
        periodContainer(
            height: subjectHeight,
            width: periodWidth,
            period: period,
            timeColor: timeColor),
        subjectContainer(
            height: subjectHeight,
            width: subjectWidth,
            raw: raw,
            column: 0,
            sheetColor: sheetColor),
        subjectContainer(
            height: subjectHeight,
            width: subjectWidth,
            raw: raw,
            column: 1,
            sheetColor: sheetColor),
        subjectContainer(
            height: subjectHeight,
            width: subjectWidth,
            raw: raw,
            column: 2,
            sheetColor: sheetColor),
        subjectContainer(
            height: subjectHeight,
            width: subjectWidth,
            raw: raw,
            column: 3,
            sheetColor: sheetColor),
        subjectContainer(
            height: subjectHeight,
            width: subjectWidth,
            raw: raw,
            column: 4,
            sheetColor: sheetColor),
        subjectContainer(
            height: subjectHeight,
            width: subjectWidth,
            raw: raw,
            column: 5,
            sheetColor: sheetColor),
      ],
    );
  }

  Widget periodContainer(
      {required double height,
      required double width,
      String period = '',
      required Color timeColor}) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * (height / 100),
      width: MediaQuery.of(context).size.width * (width / 100),
      color: timeColor,
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

  Widget subjectContainer(
      {required double height,
      required double width,
      int raw = 0,
      int column = 0,
      required Color sheetColor}) {
    var box = Hive.box('TT');
    var num = raw.toString() + column.toString();
    TTable? val = box.get(num,
        defaultValue: TTable('', '', '', '', '', '', '', '', '', '', ''));
    var Ttsubject = val!.toSubject();
    var Ttteacher = val.toTeacher();
    var Ttroom = val.toRoom();
    var TturlList = val.toUrlList();
    var Ttpartner = val.toPartner();
    var urlList = [];
    var dayandperiod = _dayandperiod(raw: raw, column: column);
    var title = '未登録';
    if (Ttsubject != '' && Ttteacher == '' && Ttroom == '') {
      title = Ttsubject;
    } else if (Ttsubject != '' && Ttteacher != '' && Ttroom == '') {
      title = '$Ttsubject\n$Ttteacher';
    } else if (Ttsubject != '' && Ttteacher == '' && Ttroom != '') {
      title = '$Ttsubject\n$Ttroom';
    } else if (Ttsubject != '' && Ttteacher != '' && Ttroom != '') {
      title = '$Ttsubject\n$Ttteacher\n$Ttroom';
    }

    return Container(
      height: MediaQuery.of(context).size.height * (height / 100),
      width: MediaQuery.of(context).size.width * (width / 100),
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
                          height:
                              MediaQuery.of(context).size.height * (4 / 100),
                          width: double.infinity,
                          color: sheetColor,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(dayandperiod,
                                style: const TextStyle(fontSize: 16)),
                          ),
                        ),
                        Container(
                          height:
                              MediaQuery.of(context).size.height * (8 / 100),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    (15 / 100),
                                color: Colors.transparent,
                                child: IconButton(
                                  onPressed: () {
                                    if (Ttsubject != '') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                RegistInfo(result: [
                                                  Ttsubject,
                                                  Ttteacher,
                                                  Ttroom,
                                                  TturlList[0],
                                                  TturlList[1],
                                                  TturlList[2],
                                                  TturlList[3],
                                                  TturlList[4],
                                                  TturlList[5],
                                                  TturlList[6],
                                                ]))),
                                      );
                                    }
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
                                  child: Text(title,
                                      style: const TextStyle(fontSize: 16)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    (15 / 100),
                                color: Colors.transparent,
                                child: TextButton(
                                  onPressed: () async {
                                    var classInfoList = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TimeTableInput(
                                                    subject: Ttsubject,
                                                    teacher: Ttteacher,
                                                    room: Ttroom,
                                                    urlList: TturlList)));
                                    if (classInfoList == null) {
                                    } else {
                                      if (classInfoList.length == 1) {
                                        setState(() {
                                          Ttsubject = '';
                                          Ttteacher = '';
                                          Ttroom = '';
                                          urlList = [
                                            '',
                                            '',
                                            '',
                                            '',
                                            '',
                                            '',
                                            ''
                                          ];
                                          box.put(
                                              num,
                                              TTable(
                                                  Ttsubject,
                                                  Ttteacher,
                                                  Ttroom,
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
                                                    Ttroom,
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
                                          Ttroom = classInfoList[2];
                                          for (int i = 3;
                                              i < classInfoList.length;
                                              i++) {
                                            urlList.add(classInfoList[i]);
                                          }
                                          box.put(
                                              num,
                                              TTable(
                                                  Ttsubject,
                                                  Ttteacher,
                                                  Ttroom,
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
                                            TTable? val2 = box2.get(Ttpartner,
                                                defaultValue: TTable(
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    ''));
                                            var Ttpartner2 = val2!.toPartner();
                                            box.put(
                                                Ttpartner,
                                                TTable(
                                                    Ttsubject,
                                                    Ttteacher,
                                                    Ttroom,
                                                    urlList[0],
                                                    urlList[1],
                                                    urlList[2],
                                                    urlList[3],
                                                    urlList[4],
                                                    urlList[5],
                                                    urlList[6],
                                                    Ttpartner2));
                                          }
                                        });
                                      }
                                    }
                                    setState(() {});
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
            child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Ttsubject,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              if (Ttteacher != '') ...{
                                Text(
                                  Ttteacher,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              },
                              if (Ttroom != '') ...{
                                Text(
                                  Ttroom,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              }
                            ],
                          ),
                        ),
                      ),
                    ))),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () async {
            if (await canLaunchUrl(URL)) {
              await launch(
                URL.toString(),
                forceSafariVC: false,
                forceWebView: false,
              );
            } else {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      title: Text('Error'),
                      content: Text('Cannot open this URL'),
                    );
                  });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (i == 0) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/classroom.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Classroom"),
              } else if (i == 1) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/teams.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Teams"),
              } else if (i == 2) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/slack.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Slack"),
              } else if (i == 3) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/outlook.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("Outlook"),
              } else if (i == 4) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/portal.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("OIT Portal"),
              } else if (i == 5) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/c-learning.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("OIT C-Learning"),
              } else if (i == 6) ...{
                SizedBox(width: MediaQuery.of(context).size.width * (1 / 100)),
                imageAsset(path: 'images/app_icons/other.png'),
                SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
                const Text("その他"),
              }
            ],
          ),
        ),
      ),
    );
  }

  Widget imageAsset({required String path}) {
    return Container(
      height: MediaQuery.of(context).size.height * (7 / 100),
      width: MediaQuery.of(context).size.height * (7 / 100),
      color: Colors.transparent,
      child: Image.asset(path),
    );
  }
}
