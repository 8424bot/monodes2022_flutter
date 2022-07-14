// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/model/db/home/CourseGrade.dart';

DateTime _date = DateTime.now();
TimeOfDay _time = TimeOfDay.now();

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String _subject = "";
  String _task = "";
  String _course = '';
  int _grade = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('CG');
    CG val = box.get('0', defaultValue: CG('R', 1));
    String course = val.tocourse();
    int grade = val.tograde();
    if (i == 0) {
      _course = course;
      _grade = grade;
      i++;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('新規課題投稿'),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const DatePicker(),
                const TimePicker(),
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
                        DropdownMenuItem(
                          value: 'RS',
                          child: Text('RS科'),
                        ),
                        DropdownMenuItem(
                          value: 'RSW',
                          child: Text('RSW科'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _course = value!;
                        });
                      },
                      value: _course,
                    ),
                    DropdownButton(
                      items: const [
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
                      onChanged: (int? value) {
                        setState(() {
                          _grade = value!;
                        });
                      },
                      value: _grade,
                    ),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '科目名を入力',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _subject = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '課題内容を入力',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _task = value;
                    });
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _date = DateTime(_date.year, _date.month, _date.day,
                          _time.hour, _time.minute);
                      Timestamp tsDate = Timestamp.fromDate(_date);
                      CollectionReference Todo =
                          FirebaseFirestore.instance.collection('TodoList');
                      Todo.add({
                        'course': _course,
                        'date': tsDate,
                        'grade': _grade,
                        'subject': _subject,
                        'task': _task,
                      });
                      Navigator.of(context).pop();
                    },
                    child:
                        const Text('投稿', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('キャンセル'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//date
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  void onPressedRaisedButton() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (picked != null) {
      setState(() => _date = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
                child: Text("${_date.year}年${_date.month}月${_date.day}日",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () => onPressedRaisedButton(),
                child: const Text('日付選択',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
          ],
        ));
  }
}

//time
class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  void onPressedRaisedButton() async {
    final TimeOfDay? picked =
        (await showTimePicker(context: context, initialTime: TimeOfDay.now()));
    if (picked != null) {
      setState(() => _time = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
                child: Text("${_time.hour}時${_time.minute}分",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () => onPressedRaisedButton(),
                child: const Text('時刻選択',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
          ],
        ));
  }
}
