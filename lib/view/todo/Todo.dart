// ignore_for_file: file_names

import 'package:flutter/material.dart';

DateTime gdate = DateTime.now();
TimeOfDay gtime = TimeOfDay.now();

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
  // ignore: library_private_types_in_public_api
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return const TodoAddPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList.add(newListText +
                  " ${gdate.year}年${gdate.month}月${gdate.day}日" +
                  " ${gtime.hour}時${gtime.minute}分");
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
  // ignore: library_private_types_in_public_api
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ
  String _text = '';
  String _task = '';

  // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body: Container(
        // 余白を付ける
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const DatePicker(),
              const TimePicker(),
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
                    _text = value;
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
                    Navigator.of(context).pop("$_text $_task");
                  },
                  child: const Text('リスト追加', style: TextStyle(color: Colors.white)),
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
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // 現在日時
  DateTime _date = DateTime.now();

  // ボタン押下時のイベント
  void onPressedRaisedButton() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime.now().add(const Duration(days: 360)));

    if (picked != null) {
      // 日時反映
      setState(() => _date = picked);
      setState(() => gdate = picked);
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
                    style:
                        const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
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
  // ignore: library_private_types_in_public_api
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  // 現在日時
  TimeOfDay _time = TimeOfDay.now();

  // ボタン押下時のイベント
  void onPressedRaisedButton() async {
    final TimeOfDay? picked =
        (await showTimePicker(context: context, initialTime: TimeOfDay.now()));
    if (picked != null) {
      // 日時反映
      setState(() => _time = picked);
      setState(() => gtime = picked);
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
                    style:
                        const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
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
