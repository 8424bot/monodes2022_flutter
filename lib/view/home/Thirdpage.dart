import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyThirdPage extends StatelessWidget {
  const MyThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "作成者",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Text(
                  'グループメンバー',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/images_home/background.jpg'),
                        fit: BoxFit.cover),
                    color: const Color.fromARGB(255, 141, 191, 232),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    )),
                child: const Text(
                  'S科　川瀬智士\nR科　五味凌成\nS科　松本裕也\nS科　橋西尚輝\nS科　上野遥平\nS科　片岡篤哉',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'ものづくりデザイン実践演習で作成',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
