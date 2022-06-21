import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  final valuecontroller1 = TextEditingController();
  final valuecontroller2 = TextEditingController();
  String name;
  TextInput(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, name); 
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('授業登録'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: valuecontroller1,
                decoration: const InputDecoration(
                hintText: "授業名を入力してください",
                ),
              ),
              TextField(
                controller: valuecontroller2,
                decoration: const InputDecoration(
                hintText: "担当教員を入力してください",
                ),
              ),
              ElevatedButton(
                child: const Text('登録'),
                onPressed: () {
                  Navigator.of(context).pop('${valuecontroller1.text}\n${valuecontroller2.text}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}