// ignore_for_file: use_build_context_synchronously

import 'package:app_home_demo/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:app_home_demo/view/timetable/Timetable_page.dart';
import 'package:app_home_demo/view/todo/Todo.dart';
import 'package:app_home_demo/view/bookmark/memo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/model/db/home/CourseGrade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;

  toggle() {
    _isDark = !_isDark;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}



class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const _Root(),
    );
  }
}

class _Root extends StatefulWidget {
  const _Root({Key? key}) : super(key: key);

  @override
  State<_Root> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_Root> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    home(),
    const MyTodoApp(),
    const TimeTable(),
    const BookMark(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showStatusPage(context));
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(_title),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_sharp),
            label: 'Todo',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Memo',
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

void _showStatusPage(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();

  if (pref.getBool('isAlreadyFirstLaunch') != true) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const StatusPage(),
    );
    pref.setBool('isAlreadyFirstLaunch', true);
  }
}

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('CG');
    CG val = box.get('0', defaultValue: CG('R', 1));
    String myCourse = val.tocourse();
    int myGrade = val.tograde();

    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text('ようこそ', textAlign: TextAlign.center),
        content:
            const Text('あなたの学科・学年を\n選択してください', textAlign: TextAlign.center),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (15 / 100),
                    child: DropdownButton(
                      items: const [
                        DropdownMenuItem(value: 'R', child: Text('R科')),
                        DropdownMenuItem(value: 'S', child: Text('S科')),
                        DropdownMenuItem(value: 'W', child: Text('W科')),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          myCourse = value!;
                        });
                        box.put('0', CG(myCourse, myGrade));
                      },
                      value: myCourse,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * (5 / 100)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (15 / 100),
                    child: DropdownButton(
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('１年')),
                        DropdownMenuItem(value: 2, child: Text('２年')),
                        DropdownMenuItem(value: 3, child: Text('３年')),
                        DropdownMenuItem(value: 4, child: Text("４年")),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          myGrade = value!;
                        });
                        box.put('0', CG(myCourse, myGrade));
                      },
                      value: myGrade,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (35 / 100),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Root()),
                      (_) => false,
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child:
                      const Text('決定', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
