// main.dart
// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:app_home_demo/model/db/bkm/sql_helper.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BookMark> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    id == null ? '新規登録' : '編集',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _titleController,
                            decoration:
                                const InputDecoration(hintText: 'Title'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                                hintText: 'URL or Description'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _titleController.text = '';
                                    _descriptionController.text = '';
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close')),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_titleController.text != '') {
                                    if (_descriptionController.text != '') {
                                      // Save new journal
                                      if (id == null) {
                                        await _addItem();
                                      }

                                      if (id != null) {
                                        await _updateItem(id);
                                      }

                                      // Clear the text fields
                                      _titleController.text = '';
                                      _descriptionController.text = '';
                                      // Close the bottom sheet
                                      Navigator.of(context).pop();
                                    }
                                  }
                                },
                                child:
                                    Text(id == null ? 'Create New' : 'Update'),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('削除が完了しました'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ページ登録'),
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
                                          '＋アイコンからURLなどの必要な情報の登録ができます。\n詳しい説明はHomeの「アプリの使い方」を参照してください。'),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            Builder(builder: (context) {
                                              return ElevatedButton(
                                                child: const Text('閉じる'),
                                                onPressed: () {
                                                  Navigator.pop(context);
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Slidable(
                    endActionPane:
                        ActionPane(motion: const DrawerMotion(), children: [
                      SlidableAction(
                        flex: 1,
                        icon: Icons.create,
                        backgroundColor: Colors.green,
                        label: '編集',
                        onPressed: (_) {
                          _showForm(_journals[index]['id']);
                        },
                      ),
                      SlidableAction(
                        flex: 1,
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                        label: '削除',
                        onPressed: (_) {
                          _deleteItem(_journals[index]['id']);
                        },
                      ),
                    ]),
                    child: Card(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        title: Text(_journals[index]['title']),
                        subtitle: Text(_journals[index]['description']),
                        trailing: const SizedBox(
                          width: 100,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                if (_journals[index]['description']
                                    .contains('http')) {
                                  return AlertDialog(
                                    title: Text(_journals[index]['title']),
                                    content:
                                        Text(_journals[index]['description']),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            child: const Text('Jump to Page'),
                                            onPressed: () async {
                                              Uri URL = Uri.parse(
                                                  _journals[index]
                                                      ['description']);
                                              if (await canLaunchUrl(URL)) {
                                                await launchUrl(URL);
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return const AlertDialog(
                                                        title: Text('Error'),
                                                        content: Text(
                                                            'Cannot open this URL'),
                                                      );
                                                    });
                                              }
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                } else {
                                  return AlertDialog(
                                    title: Text(_journals[index]['title']),
                                    content:
                                        Text(_journals[index]['description']),
                                  );
                                }
                              });
                        },
                      ),
                    ),
                  )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
