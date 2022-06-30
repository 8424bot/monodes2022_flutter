import 'package:app_home_demo/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime _date = DateTime.now();
TimeOfDay _time = TimeOfDay.now();

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String _subject = "";
  String _task = "";
  String course = myCourse;
  int grade = myGrade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('新規課題投稿'),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            // 余白を付ける
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
                      //4
                      items: const [
                        //5
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
                      //6
                      onChanged: (String? value) {
                        setState(() {
                          course = value!;
                        });
                      },
                      //7
                      value: course,
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
                          grade = value!;
                        });
                      },
                      //7
                      value: grade,
                    ),
                  ],
                ),
                // テキスト入力
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '科目名を入力',
                  ),
                  // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                  onChanged: (String value) {
                    // データが変更したことを知らせる（画面を更新する）
                    setState(() {
                      // データを変更
                      _subject = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '課題内容を入力',
                  ),
                  // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                  onChanged: (String value) {
                    // データが変更したことを知らせる（画面を更新する）
                    setState(() {
                      // データを変更
                      _task = value;
                    });
                  },
                ),
                SizedBox(
                  // 横幅いっぱいに広げる
                  width: double.infinity,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    onPressed: () {
                      // "pop"で前の画面に戻る
                      // "pop"の引数から前の画面にデータを渡す
                      _date = DateTime(_date.year, _date.month, _date.day,
                          _time.hour, _time.minute);
                      Timestamp tsDate = Timestamp.fromDate(_date);
                      CollectionReference Todo =
                          FirebaseFirestore.instance.collection('TodoList');
                      Todo.add({
                        'course': course,
                        'date': tsDate,
                        'grade': grade,
                        'subject': _subject,
                        'task': _task,
                      });
                      //_onSubmitted;
                      Navigator.of(context).pop();
                    },
                    child: const Text('リスト追加',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  // 横幅いっぱいに広げる
                  width: double.infinity,
                  // キャンセルボタン
                  child: TextButton(
                    // ボタンをクリックした時の処理
                    onPressed: () {
                      // "pop"で前の画面に戻る
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

// _onSubmitted() {
//   //_textEditingController.clear();
// }

//date
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // 現在日時

  // ボタン押下時のイベント
  void onPressedRaisedButton() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (picked != null) {
      // 日時反映
      setState(() => _date = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // 日時表示部分
            Center(
                child: Text("${_date.year}年${_date.month}月${_date.day}日",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))),
            // DatePicker表示ボタン。
            TextButton(
                onPressed: () =>
                    // 押下時のイベントを宣言。
                    onPressedRaisedButton(),
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
  // 現在日時

  // ボタン押下時のイベント
  void onPressedRaisedButton() async {
    final TimeOfDay? picked =
        (await showTimePicker(context: context, initialTime: TimeOfDay.now()));
    if (picked != null) {
      // 日時反映
      setState(() => _time = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // 日時表示部分
            Center(
                child: Text("${_time.hour}時${_time.minute}分",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))),
            // DatePicker表示ボタン。
            TextButton(
                onPressed: () =>
                    // 押下時のイベントを宣言。
                    onPressedRaisedButton(),
                child: const Text('時刻選択',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
          ],
        ));
  }
}
