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
          title: const Text("作成者"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[Text("editor")],
          ),
        ));
  }
}
