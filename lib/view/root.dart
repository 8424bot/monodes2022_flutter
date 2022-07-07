import 'package:app_home_demo/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:app_home_demo/view/timetable/Timetable_page.dart';
import 'package:app_home_demo/view/todo/Todo.dart';
import 'package:app_home_demo/view/bookmark/memo.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Root> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const home(),
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
