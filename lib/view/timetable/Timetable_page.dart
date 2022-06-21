// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'textinput_page.dart';
import 'webpage.dart';

class Timateble extends StatefulWidget {
  const Timateble({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _TimatebleState createState() => _TimatebleState();
}

var _result = [
  [' ', ' ', ' ', ' ', ' ', ' '], 
  [' ', ' ', ' ', ' ', ' ', ' '], 
  [' ', ' ', ' ', ' ', ' ', ' '], 
  [' ', ' ', ' ', ' ', ' ', ' '], 
  [' ', ' ', ' ', ' ', ' ', ' '], 
  [' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' '] ];

var _subject = [
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'], 
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'], 
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'], 
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'], 
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'], 
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'] ];

var _entry = [
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'], 
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'], 
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'], 
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'], 
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'], 
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'] ];

class _TimatebleState extends State<Timateble> {
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
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.info),
                            Text(_subject[raw][column], textAlign: TextAlign.center,),
                            Text(_entry[raw][column]),                          
                          ],
                        ),
                        onTap: () async {
                          var result = await Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => TextInput(_result[raw][column])),  
                          );
                          setState(() {
                            _result[raw][column] = result;
                            _subject[raw][column] = result.replaceAll('\n', '  ');
                            _entry[raw][column] = '登録情報変更';
                          });
                          Navigator.pop(context);
                        }
                      ),
                      bottomSheetContainer(
                        url:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Google_Classroom_icon.svg/1186px-Google_Classroom_icon.svg.png",
                        pagename: 'ClassroomPage',
                        text: "Classroom",
                        raw: raw,
                        column: column,
                      ),
                      bottomSheetContainer(
                        url:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg/330px-Microsoft_Office_Teams_%282018%E2%80%93present%29.svg.png",
                        pagename: 'TeamsPage',
                        text: "Teams",
                        raw: raw,
                        column: column,
                      ),
                      bottomSheetContainer(
                        url:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Microsoft_Office_Outlook_%282018%E2%80%93present%29.svg/640px-Microsoft_Office_Outlook_%282018%E2%80%93present%29.svg.png",
                        pagename: 'OutlookPage',
                        text: "Outlook",
                        raw: raw,
                        column: column,
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _result[raw][column],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetContainer({
    String url = '',
    String pagename = '',
    String text = '',
    int raw = 0,
    int column = 0,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * (12 / 100),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x80000000),
            offset: Offset(0, 4),
            blurRadius: 6,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.lightBlue[50],
          onTap: () {
            if (pagename == 'ClassroomPage') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClassroomPage()),
              );
            } else if (pagename == 'TeamsPage') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TeamsPage()),
              );
            } else if (pagename == 'OutlookPage') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OutlookPage(_result[raw][column])),
              );
            } else {}
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                url,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * (5 / 100)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(text),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 