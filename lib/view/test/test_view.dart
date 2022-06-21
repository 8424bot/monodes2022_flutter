// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_home_demo/model/db/bkm_db.dart';
import 'package:app_home_demo/model/freezed/bkm/bkm_model.dart';
import 'package:app_home_demo/view_model/bkm/bkm_provider.dart';


class Todo extends HookConsumerWidget {
  const Todo({Key? key}) : super(key: key);

  List<Widget> _buildBkmList(
    List<BkmItemData> bkmItemList, BkmDatabaseNotifier db
  ) {
    List<Widget> list = [];
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    for (BkmItemData item in bkmItemList) {
      Widget tile = Slidable(
        // ignore: sort_child_properties_last
        child: ListTile(
          tileColor: Colors.lightBlue[50],
          title: Text(item.pagename),
          onTap: () async {
            final Uri url = Uri.parse(item.url);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
            }
          },
        ),
        endActionPane: ActionPane(
          //スライドしたときに表示されるボタン
          motion: const DrawerMotion(),
          //スライドしたときのアニメーション
          children: [
            SlidableAction(
              flex: 1,
              //長さ
              onPressed: (_) {
                //押された時の処理
                db.deleteData(item);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
      );
      list.add(tile);
      //listにtileを追加
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final bkmState = ref.watch(bkmDatabaseProvider);
    //Providerの状態が変化したさいに再ビルドします
    final bkmProvider = ref.watch(bkmDatabaseProvider.notifier);
    //Providerのメソッドや値を取得します
    //bottomsheetが閉じた際に再ビルドするために使用します。
    // ignore: invalid_use_of_protected_member
    List<BkmItemData> bkmItems = bkmProvider.state.bkmItems;
    //Providerが保持しているtodoItemsを取得します。
    TempBkmItemData temp = TempBkmItemData();
    //追加

    List<Widget> tiles = _buildBkmList(bkmItems, bkmProvider);
    //showAlert(context);
    return Scaffold(
      body: ListView(children: tiles),
      //ListViewでtilesを表示します。
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showModalBottomSheet<void>(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context2) {
              return HookConsumer(
                builder: (context3, ref, _) {
                  // ignore: unused_local_variable
                  final limit = useState<DateTime?>(null);
                  //DatePickerが閉じた際に再ビルドするために使用します。
                  return Padding(
                    padding: MediaQuery.of(context3).viewInsets,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'pagename',
                          ),
                          onChanged: (value) {
                            //追加
                            temp = temp.copyWith(pagename: value);
                          },
                          onSubmitted: (value) {
                            //追加
                            temp = temp.copyWith(pagename: value);
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'url',
                          ),
                          onChanged: (value) {
                            //追加
                            var test = value.contains('http');
                            temp = temp.copyWith(url: value);
                          },
                          onSubmitted: (value) {
                            //追加
                            var test = value.contains('http');
                            temp = temp.copyWith(url: value);
                          },
                        ),
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.values[0],
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    bkmProvider.writeData(temp);
                                    //追加
                                    Navigator.pop(context3);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
          temp = TempBkmItemData();
          //追加
	  //floatingActionButtonの処理はここで終わりです
        },
      ),
    );
  }
}