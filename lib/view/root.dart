import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:app_home_demo/view/timetable/Timetable_page.dart';
import 'package:app_home_demo/view/todo/Todo.dart';
import 'package:app_home_demo/view/bookmark/bkm_view.dart';
import 'package:app_home_demo/view/home/home.dart';
import 'package:app_home_demo/view/timetable/Timetable_page.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

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
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    //const Text(
      //'Index 0: Home',
      //style: optionStyle,
    //),
    const home(),
    const MyTodoApp(),
    const Timateble5(),
    BookMark(),
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
          _title = 'ページ登録';
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_sharp),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.launch),
            label: 'Links',
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