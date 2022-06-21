import 'package:app_home_demo/model/freezed/bkm/bkm_model.dart';
import 'package:app_home_demo/model/db/bkm_db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart';

class BkmDatabaseNotifier extends StateNotifier<BkmStateData> {
  //データベースの状態が変わるたびTodoのviewをビルドするようにするクラスです。
  BkmDatabaseNotifier() : super(BkmStateData());
  //ここからはデータベースに関する処理をこのクラスで行えるように記述します。
  final _db = MyDatabase();
  //書き込み処理部分
  writeData(TempBkmItemData data) async {
    if (data.pagename.isEmpty) {
      return;
    }
    BkmItemCompanion entry = BkmItemCompanion(
      pagename: Value(data.pagename),
      url: Value(data.url),
    );
    state = state.copyWith(isLoading: true);
    await _db.writeBkm(entry);
    readData();
    //書き込むたびにデータベースを読み込む
  }

  //削除処理部分
  deleteData(BkmItemData data) async {
    state = state.copyWith(isLoading: true);
    await _db.deleteBkm(data.id);
    readData();
    //削除するたびにデータベースを読み込む
  }

  //更新処理部分
  updateData(BkmItemData data) async {
    if (data.pagename.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    await _db.updateBkm(data);
    readData();
    //更新するたびにデータベースを読み込む
  }

  //データ読み込み処理
  readData() async {
    state = state.copyWith(isLoading: true);

    final bkmItems = await _db.readAllBkmData();

    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      bkmItems: bkmItems,
    );
    //stateを更新します
    //freezedを使っているので、copyWithを使うことができます
    //これは、stateの中身をすべて更新する必要がありません。例えば
    //state.copyWith(isLoading: true)のように一つの値だけを更新することもできます。
    //複数の値を監視したい際、これはとても便利です。
  }
}

final bkmDatabaseProvider = StateNotifierProvider((_) {
  BkmDatabaseNotifier notify = BkmDatabaseNotifier();
  notify.readData();
  //初期化処理
  return notify;
});