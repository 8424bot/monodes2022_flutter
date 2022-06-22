// ignore_for_file: depend_on_referenced_packages

import 'package:app_home_demo/model/db/bkm_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bkm_model.freezed.dart';

@freezed
abstract class BkmStateData with _$BkmStateData {
  //このクラスは、DBの状態を保持するクラスです。
  factory BkmStateData({
    @Default(false) bool isLoading, 
    @Default(false) bool isReadyData,
    @Default([]) List<BkmItemData> bkmItems,
  }) = _BkmStateData;
}

@freezed
abstract class TempBkmItemData with _$TempBkmItemData {
  //このクラスは、入力中のtodoを保持するクラスです。
  factory TempBkmItemData({
    @Default('') String pagename,
    @Default('') String url,
  }) = _TempBkmItemData;
}