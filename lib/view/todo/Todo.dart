import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

DateTime _date = DateTime.now();
TimeOfDay _time = TimeOfDay.now();
String course = 'R';
int grade = 1;

class textTodoList {
  String _subject;
  String _task;

  textTodoList(this._subject, this._task);
}

void main() {
  // 最初に表示するWidget
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: const TodoListPage(),
    );
  }
}

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        centerTitle: true,
        title: const Text("課題一覧"),
      ),
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          TextStyle TodoLimitd() {
            if (todoList[index][2].isBefore(DateTime.now())) {
              return const TextStyle(color: Colors.redAccent);
            }
            return const TextStyle(color: Colors.black);
          }

          Color TodoNearLimit() {
            if (todoList[index][2]
                .isBefore(DateTime.now().add(const Duration(days: 1)))) {
              return Colors.yellow;
            }
            return Colors.white;
          }

          return Card(
            child: ListTile(
              tileColor: TodoNearLimit(),
              title: Text(
                "${todoList[index][3]}科 ${todoList[index][4]}年 ${todoList[index][0] + " " + todoList[index][1]}\n${todoList[index][2].year}年${todoList[index][2].month}月${todoList[index][2].day}日 ${todoList[index][2].hour}時${todoList[index][2].minute}分",
                style: TodoLimitd(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final subject = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return const TodoAddPage();
            }),
          );
          if (subject != null) {
            //_dateと_timeを統合
            _date = DateTime(
                _date.year, _date.month, _date.day, _time.hour, _time.minute);
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList
                  .add([subject._subject, subject._task, _date, course, grade]);
              todoList.sort(
                (a, b) {
                  return a[2].compareTo(b[2]);
                },
              );
              //臨時の時間切れ消去プログラム置き場
              while (todoList.isNotEmpty) {
                if (todoList[0][2].isBefore(
                    DateTime.now().subtract(const Duration(days: 1)))) {
                  todoList.removeAt(0);
                } else {
                  break;
                }
              }
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({Key? key}) : super(key: key);

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ
  String _subject = '';
  String _task = '';

  // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('リスト追加'),
        ),
        body: SingleChildScrollView(
          //ここから3行と締めのカッコ編集
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
                  const SizedBox(height: 8),
                  SizedBox(
                    // 横幅いっぱいに広げる
                    width: double.infinity,
                    // リスト追加ボタン
                    child: ElevatedButton(
                      onPressed: () {
                        // "pop"で前の画面に戻る
                        // "pop"の引数から前の画面にデータを渡す
                        Navigator.of(context)
                            .pop(textTodoList(_subject, _task));
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
                ]),
          ),
        ));
  }
}

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
