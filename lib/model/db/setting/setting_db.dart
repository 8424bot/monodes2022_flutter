// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

part 'setting_db.g.dart';

@HiveType(typeId: 2)
class SetIcon {
  @HiveField(0)
  int count;
  @HiveField(1)
  bool onoff;

  SetIcon(this.count, this.onoff);
}