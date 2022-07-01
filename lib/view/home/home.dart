import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Thirdpage.dart';
import 'Secondpage.dart';

String myCourse = "R";
int myGrade = 1;

void main() {
  runApp(const home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 16),
            child: const Text(
              'Support App',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 55,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: AssetImage(
              "images/images_home/OIT.jpg",
            ),
            width: 200,
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'For OIT student',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const MyThirdPage();
                  }));
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('作成者'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const MySecondPage();
                  }));
                },
                child: Text('アプリの使い方'),
              ),
            ],
          ),
          Container(
            child: Text('    '),
          ),
          Container(
            child: const Text(
              'Your Status',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 'R',
                    child: Text('R科'),
                  ),
                  DropdownMenuItem(
                    value: 'S',
                    child: Text('S科'),
                  ),
                  DropdownMenuItem(
                    value: 'W',
                    child: Text('W科'),
                  ),
                ],
                //6
                onChanged: (String? value) {
                  setState(() {
                    myCourse = value!;
                  });
                },
                //7
                value: myCourse,
              ),
              DropdownButton(
                //4
                items: const [
                  //5
                  DropdownMenuItem(
                    value: 1,
                    child: Text('１年'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('２年'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('３年'),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Text("４年"),
                  ),
                ],
                //6
                onChanged: (int? value) {
                  setState(() {
                    myGrade = value!;
                  });
                },
                //7
                value: myGrade,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
