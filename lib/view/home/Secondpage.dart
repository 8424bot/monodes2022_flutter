import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("取扱説明書"),
      ),
      body: Container(
        //color: Colors.lightGreenAccent,
        child: const Center(
          child: Text(
            "ここに内容を書いていくんじゃ！",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              backgroundColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
