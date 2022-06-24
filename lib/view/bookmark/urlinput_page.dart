// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class urlinput extends StatelessWidget {
  final valuecontroller1 = TextEditingController();
  final valuecontroller2 = TextEditingController();
  String name;
  String _name = '';
  String url;
  String _url = '';
  urlinput(this.name, this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, '$name##$url'); 
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ページ登録'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: name),
                onChanged: (value1) {
                  _name = value1;
                },
                decoration: const InputDecoration(
                  hintText: 'ページ名を入力してください'
                ),
              ),
              TextField(
                controller: TextEditingController(text: url),
                onChanged: (value2) {
                  _url = value2;
                },
                decoration: const InputDecoration(
                  hintText: 'URLを入力してください'
                ),
              ),
              ElevatedButton(
                child: const Text('登録'),
                onPressed: () {
                  if (_name == '' || _url == '') {
                    showDialog(
                      context: context, 
                      builder: (_) {
                        return const AlertDialog(
                          title: Text('入力エラー'),
                          content: Text('ページ名,URLのどちらか, もしくは両方が空欄です\n登録をキャンセルしますか？'),
                          //actions: [
                            //TextButton(
                              //child: const Text('Cancel'),
                              //onPressed: () {
                                //Navigator.pop(context);
                              //},  
                            //),
                            //TextButton(
                              //child: const Text('OK'),
                              //onPressed: () {
                                //Navigator.pop(context);
                                //Navigator.pop(context, '$name##$url'); 
                              //},
                            //),
                          //],
                        );
                      },
                    );
                  } else {
                    Navigator.of(context).pop('$_name##$_url');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}