import 'package:app_home_demo/view/home/home.dart';
import 'package:app_home_demo/view/todo/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> stFilter(bool value) {
    if (myCourse == "R") {
      return FirebaseFirestore.instance
          .collection("TodoList")
          .orderBy("date")
          .where("course", whereIn: ["R", "RS", "RSW"])
          .where("grade", isEqualTo: myGrade)
          .snapshots();
    } else if (myCourse == "S") {
      return FirebaseFirestore.instance
          .collection("TodoList")
          .orderBy("date")
          .where("course", whereIn: ["S", "RS", "RSW"])
          .where("grade", isEqualTo: myGrade)
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection("TodoList")
          .orderBy("date")
          .where("course", whereIn: ["W", "RSW"])
          .where("grade", isEqualTo: myGrade)
          .snapshots();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('課題掲示板'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          //stream: stFilter(true),

          stream: FirebaseFirestore.instance
              .collection("TodoList")
              .orderBy("date")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data?.docs == null) {
              return Text("no data");
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  if (DateTime.now().isAfter(
                      document["date"].toDate().add(Duration(hours: 3)))) {
                    print(DateTime.now());
                    String i = document.id;
                    FirebaseFirestore.instance
                        .collection("TodoList")
                        .doc(i)
                        .delete();
                  }
                  return Visibility(
                      visible: (myGrade == document["grade"] &&
                          document["course"].contains(myCourse)),
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
                                  tileColor: (DateTime.now()
                                          .isAfter((document["date"].toDate())))
                                      ? Colors.black
                                      : Colors.white,
                                  textColor: (DateTime.now()
                                          .isAfter((document["date"].toDate())))
                                      ? Colors.white
                                      : (DateTime.now().isAfter(
                                              (document["date"]
                                                  .toDate()
                                                  .subtract(
                                                      Duration(days: 1)))))
                                          ? Colors.redAccent
                                          : Colors.black,
                                )
                              : null)));
                }).toList(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PostPage();
              }));
            },
            child: const Icon(Icons.edit)));
  }
}
