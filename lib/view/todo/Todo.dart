import 'package:app_home_demo/view/home/home.dart';
import 'package:app_home_demo/view/todo/post.dart';
import 'package:app_home_demo/view/todo/update.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_home_demo/model/db/home/CourseGrade.dart';
import 'package:app_home_demo/view/home/Todo_explain.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({Key? key}) : super(key: key);
  @override
  State<MyTodoApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyTodoApp> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('CG');
    CG val = box.get('0', defaultValue: CG('R', 1));
    String myCourse = val.tocourse();
    int myGrade = val.tograde();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('課題掲示板'),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return WillPopScope(
                          onWillPop: () async => true,
                          child: AlertDialog(
                              title: const Align(
                                alignment: Alignment.center,
                                child: Text('操作説明'),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                            '＋アイコンから課題登録ができます。登録したものは横にスライドして「編集」「削除」ができます。\n詳しい説明は右下の「詳しく見る」ボタンから参照してください。'),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Builder(builder: (context) {
                                              return ElevatedButton(
                                                child: const Text('閉じる'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              );
                                            }),
                                            Builder(builder: (context) {
                                              return ElevatedButton(
                                                child: const Text('詳しく見る'),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context, 
                                                    MaterialPageRoute(builder: (context) => const MyTodoExplainPage())
                                                  );
                                                },
                                              );
                                            }),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )));
                    });
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("TodoList")
                .orderBy("date")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  delete(String id) {
                    FirebaseFirestore.instance
                        .collection("TodoList")
                        .doc(id)
                        .delete();
                  }

                  if (DateTime.now().isAfter(document["date"]
                      .toDate()
                      .add(const Duration(hours: 3)))) {
                    String i = document.id;
                    FirebaseFirestore.instance
                        .collection("TodoList")
                        .doc(i)
                        .delete();
                  }
                  return Visibility(
                      visible: (myGrade == document["grade"] &&
                          document["course"].contains(myCourse)),
                      child: Slidable(
                        startActionPane: ActionPane(
                            extentRatio: 0.22,
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                autoClose: true,
                                flex: 1,
                                icon: Icons.create,
                                backgroundColor: Colors.green,
                                label: '編集',
                                onPressed: (BuildContext context) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    //CupertinoPageRoute<=>MaterialPageRoute
                                    return UpdatePage(
                                      subject: document["subject"],
                                      task: document["task"],
                                      date: document["date"].toDate(),
                                      time: TimeOfDay(
                                          hour: document["date"].toDate().hour,
                                          minute:
                                              document["date"].toDate().minute),
                                      course: document["course"],
                                      grade: document["grade"],
                                      id: document.id,
                                    );
                                  }));
                                },
                              )
                            ]),
                        endActionPane: ActionPane(
                            extentRatio: 0.22,
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                  flex: 1,
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  label: '削除',
                                  onPressed: (BuildContext context) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              "${document["task"]} を削除しますか？"),
                                          content:
                                              const Text("掲示板から削除され、元に戻せません"),
                                          actions: <Widget>[
                                            // ボタン領域
                                            TextButton(
                                                child: const Text("はい"),
                                                onPressed: () {
                                                  delete(document.id);
                                                  Navigator.of(context).pop();
                                                }),
                                            Builder(builder: (context) {
                                              return TextButton(
                                                child: const Text("いいえ"),
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                              );
                                            }),
                                          ],
                                        );
                                      },
                                    );
                                  })
                            ]),
                        child: Card(
                            child: (myGrade == document["grade"] &&
                                    document["course"].contains(myCourse)
                                ? ListTile(
                                    title: Text("${document['subject']}"
                                        " ${document['task']}"
                                        //" ${document["date"].toDate().year}年"
                                        " ${document["date"].toDate().month}月"
                                        "${document["date"].toDate().day}日"
                                        " ${document["date"].toDate().hour}時"
                                        "${document["date"].toDate().minute}分"),
                                    subtitle: Text("${document['course']}科"
                                        " ${document['grade']}年"),
                                    tileColor: (DateTime.now().isAfter(
                                            (document["date"].toDate())))
                                        ? Colors.black
                                        : Colors.white,
                                    textColor: (DateTime.now().isAfter(
                                            (document["date"].toDate())))
                                        ? Colors.white
                                        : (DateTime.now().isAfter((document[
                                                    "date"]
                                                .toDate()
                                                .subtract(
                                                    const Duration(days: 1)))))
                                            ? Colors.redAccent
                                            : Colors.black,
                                  )
                                : null)),
                      ));
                }).toList(),
              );
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //CupertinoPageRoute<=>MaterialPageRoute
                return const PostPage();
              }));
            },
            child: const Icon(Icons.add)));
  }
}
