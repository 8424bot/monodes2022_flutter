import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/model/db/home/CourseGrade.dart';
import 'Thirdpage.dart';
import 'Secondpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(home());
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('CG');
    CG val = box.get('0', defaultValue: CG('R', 1));
    String myCourse = val.tocourse();
    int myGrade = val.tograde();

    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 60),
          padding: EdgeInsets.only(bottom: 16),
          child: const Text(
            'Support App',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
          ),
        ),
        const Image(
          image: AssetImage(
            "images/images_home/OIT.png",
          ),
          width: double.infinity,
        ),
        Container(
          padding: const EdgeInsets.only(top: 16),
          child: const Text(
            'For OIT students',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MySecondPage();
              }));
            },
            child: const Text('アプリの使い方'),
          ),
        ),
        Container(
          child: const Text('    '),
        ),
        Container(
          child: const Text(
            'Your Status',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                box.put('0', CG(myCourse, myGrade));
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
                box.put('0', CG(myCourse, myGrade));
              },
              //7
              value: myGrade,
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        Container(
            alignment: Alignment.bottomLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyThirdPage();
                  }));
                },
                icon: Icon(Icons.account_box))),
      ]),
    ));
  }
}
