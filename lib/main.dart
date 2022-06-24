import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Todo.dart';
import 'webpage.dart';
import 'textinput_page.dart';
import 'urlinput_page.dart';

//test
//kataoka!!!!
//marge
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var _title = 'Home';
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    MyTodoApp(),
    Timateble(),
    //Text(
    //'Index 3: Settings',
    //style: optionStyle,
    //),
    oitwebpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = '課題一覧';
          break;
        case 2:
          _title = '時間割';
          break;
        case 3:
          _title = 'setting';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//timetable_page
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
  [' ', ' ', ' ', ' ', ' ', ' ']
];

var _subject = [
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録'],
  ['未登録', '未登録', '未登録', '未登録', '未登録', '未登録']
];

var _entry = [
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録'],
  ['授業登録', '授業登録', '授業登録', '授業登録', '授業登録', '授業登録']
];

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

  TableRow subjectTableRow(
      {double height = 14, String period = '', int raw = 0}) {
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
                              Text(
                                _subject[raw][column],
                                textAlign: TextAlign.center,
                              ),
                              Text(_entry[raw][column]),
                            ],
                          ),
                          onTap: () async {
                            var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TextInput(_result[raw][column])),
                            );
                            setState(() {
                              _result[raw][column] = result;
                              _subject[raw][column] =
                                  result.replaceAll('\n', '  ');
                              _entry[raw][column] = '登録情報変更';
                            });
                            Navigator.pop(context);
                          }),
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
                MaterialPageRoute(
                    builder: (context) => OutlookPage(_result[raw][column])),
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

///////////////////////////////////////////////////////////////////////////////////
//webpage
// ignore: camel_case_types
class oitwebpage extends StatefulWidget {
  const oitwebpage({Key? key}) : super(key: key);

  @override
  State<oitwebpage> createState() => _oitwebpagestate();
}

final _url = [
  'https://www.portal.oit.ac.jp/CAMJWEB/top.do',
  'https://www.oit.ac.jp/',
  'https://oit.c-learning.jp/s/index',
  '',
  '',
  '',
  '',
  ''
];
final _pagename = ['ポータルサイト', '大阪工業大学 ホームページ', 'c-larning', '', '', '', '', ''];
final _onoff = [true, true, true, false, false, false, false, false];
int j = 3;
// ignore: non_constant_identifier_names
final _PopupValue = ['', '', '', '', '', '', '', ''];
// ignore: non_constant_identifier_names
final _PopupMenuValue = [
  ['再登録', 'delete'],
  ['再登録', 'delete'],
  ['再登録', 'delete'],
  ['再登録', 'delete'],
  ['再登録', 'delete'],
  ['再登録', 'delete'],
  ['再登録', 'delete'],
  ['再登録', 'delete']
];

// ignore: camel_case_types
class _oitwebpagestate extends State<oitwebpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          pageselect(
              url: _url[0], pagename: _pagename[0], onoff: _onoff[0], i: 0),
          pageselect(
              url: _url[1], pagename: _pagename[1], onoff: _onoff[1], i: 1),
          pageselect(
              url: _url[2], pagename: _pagename[2], onoff: _onoff[2], i: 2),
          pageselect(
              url: _url[3], pagename: _pagename[3], onoff: _onoff[3], i: 3),
          pageselect(
              url: _url[4], pagename: _pagename[4], onoff: _onoff[4], i: 4),
          pageselect(
              url: _url[5], pagename: _pagename[5], onoff: _onoff[5], i: 5),
          pageselect(
              url: _url[6], pagename: _pagename[6], onoff: _onoff[6], i: 6),
          pageselect(
              url: _url[7], pagename: _pagename[7], onoff: _onoff[7], i: 7),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
            tooltip: '登録する',
            icon: const Icon(Icons.add),
            label: const Text('add'),
            onPressed: () async {
              if (j >= 8) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      title: Text('Sorry'),
                      content: Text('NO more can be added'),
                    );
                  },
                );
              } else {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => urlinput(_pagename[j], _url[j])),
                );
                var strAry = result.split('##');
                if (strAry[0] != '' && strAry[1] != '') {
                  setState(() {
                    _pagename[j] = strAry[0];
                    _url[j] = strAry[1];
                    _onoff[j] = true;
                    j++;
                  });
                  pageadd(url: _url[j - 1], pagename: _pagename[j - 1]);
                }
              }
            }),
      ),
    );
  }

  Widget pageselect(
      {String url = '', String pagename = '', bool onoff = false, int i = 0}) {
    if (onoff == true) {
      return pageadd(url: url, pagename: pagename, i: i);
    } else if (onoff == false) {
      return pagedelete(url: url, pagename: pagename, i: i);
    } else {
      throw Error;
    }
  }

  Widget pageadd({String url = '', String pagename = '', int i = 0}) {
    return Container(
      height: MediaQuery.of(context).size.height * (7 / 100),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 146, 220, 255),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.lightBlue[50],
          onTap: () async {
            // ignore: deprecated_member_use
            if (await canLaunch(url)) {
              // ignore: deprecated_member_use
              await launch(url, forceSafariVC: false);
            } else {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Error!'),
                    content: const Text('このURLは開くことができません'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(' '),
              Text(
                pagename,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              PopupMenuButton<String>(
                initialValue: _PopupValue[i],
                itemBuilder: (BuildContext context) {
                  return _PopupMenuValue[i].map((String s) {
                    return PopupMenuItem(
                      value: s,
                      child: Text(s),
                    );
                  }).toList();
                },
                onSelected: (String s) async {
                  setState(() {
                    _PopupValue[i] = s;
                  });
                  if (_PopupValue[i] == '再登録') {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              urlinput(_pagename[i], _url[i])),
                    );
                    var strAry = result.split('##');
                    if (strAry[0] != '' && strAry[1] != '') {
                      setState(() {
                        _pagename[i] = strAry[0];
                        _url[i] = strAry[1];
                        _onoff[i] = true;
                      });
                      pageadd(url: _url[i], pagename: _pagename[i]);
                    }
                  } else if (_PopupValue[i] == 'delete') {
                    _url.removeAt(i);
                    _url.add('');
                    _pagename.removeAt(i);
                    _pagename.add('');
                    _onoff.removeAt(i);
                    _onoff.add(false);
                    j--;
                  } else {
                    throw Error;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pagedelete({String url = '', String pagename = '', int i = 0}) {
    return Container(
      height: MediaQuery.of(context).size.height * (7 / 100),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: const Material(
        child: InkWell(
          onTap: null,
        ),
      ),
    );
  }
}
