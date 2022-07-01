// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app_home_demo/model/db/bkm_db.dart';
import 'package:app_home_demo/model/freezed/bkm/bkm_model.dart';
import 'package:app_home_demo/view_model/bkm/bkm_provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class BookMark extends ConsumerWidget {
  // 入力中のtodoのインスタンスを作成
  TempBkmItemData temp = TempBkmItemData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態が変化するたびに再ビルドする
    // ignore: unused_local_variable
    final bkmState = ref.watch(bkmDatabaseProvider);

    // メソッドや値を取得する
    final bkmNotifier = ref.watch(bkmDatabaseProvider.notifier);

    // 追加画面を閉じたら再ビルドするために使用する
    // ignore: invalid_use_of_protected_member
    List<BkmItemData> bkmItems = bkmNotifier.state.bkmItems;

    // todoの一覧を格納するリスト
    List<Widget> tiles = _buildBkmList(bkmItems, bkmNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ページ登録'),
      ),
      body: ListView(children: tiles),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context2) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _createTask(),
                ],
              );
            },
          );
          temp = TempBkmItemData();
        },
      ),
    );
  }

  // todo一覧
  List<Widget> _buildBkmList(
    List<BkmItemData> items,
    BkmDatabaseNotifier db,
  ) {
    List<Widget> list = [];
    for (BkmItemData item in items) {
      Widget tile = _tile(item, db);
      list.add(tile);
    }
    return list;
  }

  // todo
  Widget _tile(BkmItemData item, BkmDatabaseNotifier db) {
    return Consumer(
      builder: ((context, ref, child) {
        final select = item.url.contains('http');
        final Uri url = Uri.parse(item.url);
        return Slidable(
          // ignore: sort_child_properties_last
          child: Card(
            child: ListTile(
              title: Text(item.pagename),
              subtitle: Text(item.url),
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (_) {
                    if (select == true) {
                      return AlertDialog(
                        title: Text(item.pagename),
                        content: Text(item.url),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: const Text('Jump to Page'),
                                onPressed: () async {
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    showDialog(
                                      context: context, 
                                      builder: (_) {
                                        return const AlertDialog(
                                          title: Text('Error'),
                                          content: Text('This URL is not open'),
                                        );
                                      }
                                    );
                                  }
                                },
                              ),
                          ],
                          )
                        ],
                      );
                    } else {
                      return AlertDialog(
                        title: Text(item.pagename),
                        content: Text(item.url),
                      );
                    }
                  }
                );
              },
            ),
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                flex: 1,
                icon: Icons.create,
                backgroundColor: Colors.green,
                label: '編集',
                onPressed: (_) async {
                  await showDialog(
                    context: context,
                    builder: (context2) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _editTask(item),
                        ],
                      );
                    },
                  );
                },
              ),
              SlidableAction(
                flex: 1,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                label: '削除',
                onPressed: (_) {
                  db.deleteData(item);
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  // タスクの作成
  Widget _createTask() {
    return Consumer(
      builder: ((context, ref, child) {
        // 状態が変化するたびに再ビルドする
        // ignore: unused_local_variable
        final bkmState = ref.watch(bkmDatabaseProvider);

        // メソッドや値を取得する
        final bkmNotifier = ref.watch(bkmDatabaseProvider.notifier);

        return AlertDialog(
          title: const Text("新規登録"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'title',
                      ),
                      onChanged: (value) {
                        temp = temp.copyWith(pagename: value);
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'URL or Detail',
                      ),
                      onChanged: (value) {
                        temp = temp.copyWith(url: value);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // データの追加
                            bkmNotifier.writeData(temp);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // タスクの編集
  Widget _editTask(BkmItemData item) {
    return Consumer(
      builder: ((context, ref, child) {
        // 状態が変化するたびに再ビルドする
        // ignore: unused_local_variable
        final bkmState = ref.watch(bkmDatabaseProvider);

        // メソッドや値を取得する
        final bkmNotifier = ref.watch(bkmDatabaseProvider.notifier);

        // コントローラー
        // ignore: no_leading_underscores_for_local_identifiers
        final _titleController = TextEditingController(text: item.pagename);
        // ignore: no_leading_underscores_for_local_identifiers
        final _descriptionController = TextEditingController(text: item.url);

        var edited = item;

        return AlertDialog(
          title: const Text("編集"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'title',
                      ),
                      onChanged: (value) {
                        edited = edited.copyWith(pagename: value);
                      },
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'URL or Detail',
                      ),
                      onChanged: (value) {
                        edited = edited.copyWith(url: value);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // データの更新
                            bkmNotifier.updateData(edited);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}