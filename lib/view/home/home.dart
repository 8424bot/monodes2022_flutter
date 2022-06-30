import 'dart:ui';

import 'package:flutter/material.dart';

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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(40)),
              const Text(
                'Support App',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
              const Image(image: AssetImage("images/OIT.jpg"), height: 150),
              const Text(
                'For OIT students',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              const Text(
                'Your Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
