//import 'dart:ui';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/model/db/home/CourseGrade.dart';
import 'Thirdpage.dart';
import 'Secondpage.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(const home());
}

// ignore: camel_case_types
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
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/images_home/background.jpg'),
                fit: BoxFit.cover),
            color: Color.fromARGB(255, 141, 191, 232),
          ),
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const Expanded(child: SizedBox()),
              Container(
                margin: const EdgeInsets.only(top: 60),
                padding: const EdgeInsets.only(bottom: 16),
                child: const Text(
                  'Support App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
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
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.blue,
                    side: const BorderSide(color: Colors.blue)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MySecondPage();
                  }));
                },
                child: const Text('アプリの使い方'),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              const Text(
                'Your Status',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    iconEnabledColor: Colors.black54,
                    dropdownColor: Colors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 'R',
                        child: Text(
                          'R科',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'S',
                        child:
                            Text('S科', style: TextStyle(color: Colors.black)),
                      ),
                      DropdownMenuItem(
                        value: 'W',
                        child:
                            Text('W科', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                    //6
                    onChanged: (String? value) {
                      setState(() {
                        myCourse = value!;
                      });
                      box.put('0', CG(myCourse, myGrade));
                    },
                    value: myCourse,
                  ),
                  DropdownButton(
                    iconEnabledColor: Colors.black54,
                    dropdownColor: Colors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child:
                            Text('１年', style: TextStyle(color: Colors.black)),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child:
                            Text('２年', style: TextStyle(color: Colors.black)),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child:
                            Text('３年', style: TextStyle(color: Colors.black)),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child:
                            Text("４年", style: TextStyle(color: Colors.black)),
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
              // const SizedBox(
              //   height: 25,
              // ),
              SizedBox(
                width: 180,
                height: 30,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: Colors.blue,
                        side: const BorderSide(color: Colors.blue)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MyThirdPage();
                      }));
                    },
                    child: const Text(
                      'プライバシーポリシー',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(8))
            ]),
          )),
    ));
  }
}
