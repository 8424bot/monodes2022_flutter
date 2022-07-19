// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime _date = DateTime.now();
TimeOfDay _time = TimeOfDay.now();

class UpdatePage extends StatefulWidget {
  String subject;
  String task;
  DateTime date;
  TimeOfDay time;
  String course;
  int grade;
  String id;

  UpdatePage(
      {Key? key,
      required this.subject,
      required this.task,
      required this.date,
      required this.time,
      required this.course,
      required this.grade,
      required this.id})
      : super(key: key);
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    _date = widget.date;
    _time = widget.time;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('課題編集'),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DatePicker(
                  date: widget.date,
                ),
                TimePicker(time: widget.time),
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
                          widget.course = value!;
                        });
                      },
                      value: widget.course,
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
                          widget.grade = value!;
                        });
                      },
                      value: widget.grade,
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: widget.subject,
                  decoration: const InputDecoration(
                    labelText: '科目名を入力',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      widget.subject = value;
                    });
                  },
                ),
                TextFormField(
                  initialValue: widget.task,
                  decoration: const InputDecoration(
                    labelText: '課題内容を入力',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      widget.task = value;
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
                      //print(widget.subject + widget.subject);
                      FirebaseFirestore.instance
                          .collection('TodoList')
                          .doc(widget.id)
                          .update({
                        'course': widget.course,
                        'date': tsDate,
                        'grade': widget.grade,
                        'subject': widget.subject,
                        'task': widget.task,
                      });
                      Navigator.of(context).pop();
                    },
                    child:
                        const Text('変更', style: TextStyle(color: Colors.white)),
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
  DateTime date;
  DatePicker({Key? key, required this.date}) : super(key: key);
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  void onPressedRaisedButton() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null) {
      setState(() => widget.date = picked);
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
                child: Text(
                    "${widget.date.year}年${widget.date.month}月${widget.date.day}日",
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
  TimeOfDay time;
  TimePicker({Key? key, required this.time}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  void onPressedRaisedButton() async {
    final TimeOfDay? picked =
        (await showTimePicker(context: context, initialTime: widget.time));
    if (picked != null) {
      setState(() => widget.time = picked);
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
                child: Text("${widget.time.hour}時${widget.time.minute}分",
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