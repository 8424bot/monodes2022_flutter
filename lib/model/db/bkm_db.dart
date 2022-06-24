// ignore_for_file: unused_import

import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'bkm_db.g.dart';

class BkmItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get pagename => text().withDefault(const Constant('')).withLength(min: 1)();
  TextColumn get url => text().withDefault(const Constant('')).withLength(min: 1)();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [BkmItem])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //全てのデータ取得
  Future<List<BkmItemData>> readAllBkmData() => select(bkmItem).get();

  //追加
  Future writeBkm(BkmItemCompanion data) => into(bkmItem).insert(data);

  //更新
  Future updateBkm(BkmItemData data) => update(bkmItem).replace(data);

  //削除
  Future deleteBkm(int id) =>
      (delete(bkmItem)..where((it) => it.id.equals(id))).go();
}