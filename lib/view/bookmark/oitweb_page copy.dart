// ignore_for_file: file_names, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app_home_demo/model/db/bkm_db.dart';
import 'package:app_home_demo/model/freezed/bkm/bkm_model.dart';
import 'package:app_home_demo/view_model/bkm/bkm_provider.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'urlinput_page.dart';

// ignore: camel_case_types
class oitwebpage2 extends HookConsumerWidget {
  const oitwebpage2({Key? key}) : super(key: key);

  List<Widget> _buildBkmList(List<BkmItemData> bkmItemList, BkmDatabaseNotifier db) {
    List<Widget> list = [];
    for (BkmItemData item in bkmItemList) {
      Widget tile = Slidable(
        child: ListTile(
          title: Text(item.pagename),
          onTap: () async {
              await launchUrlString(item.url);
          },
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(), 
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (_) {
                db.deleteData(item);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ]
        ),
      );
      list.add(tile);
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bkmProvider = ref.watch(bkmDatabaseProvider.notifier);
    // ignore: invalid_use_of_protected_member
    List<BkmItemData> bkmItems = bkmProvider.state.bkmItems;
    TempBkmItemData temp = TempBkmItemData();
    List<Widget> tiles = _buildBkmList(bkmItems, bkmProvider);

    return Scaffold(
      body: ListView(children: tiles,),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => urlinput('', '')),
          );
          var strAry = result.split('##');
          if (strAry[0] !=  '' && strAry[1] != '') {
            temp = temp.copyWith(pagename: strAry[0], url: strAry[1]);
          }
          bkmProvider.writeData(temp);
          temp = TempBkmItemData();
        },
      ),
    );
  }
}