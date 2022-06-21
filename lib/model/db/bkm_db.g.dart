// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bkm_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BkmItemData extends DataClass implements Insertable<BkmItemData> {
  final int id;
  final String pagename;
  final String url;
  BkmItemData({required this.id, required this.pagename, required this.url});
  factory BkmItemData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BkmItemData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      pagename: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pagename'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pagename'] = Variable<String>(pagename);
    map['url'] = Variable<String>(url);
    return map;
  }

  BkmItemCompanion toCompanion(bool nullToAbsent) {
    return BkmItemCompanion(
      id: Value(id),
      pagename: Value(pagename),
      url: Value(url),
    );
  }

  factory BkmItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BkmItemData(
      id: serializer.fromJson<int>(json['id']),
      pagename: serializer.fromJson<String>(json['pagename']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pagename': serializer.toJson<String>(pagename),
      'url': serializer.toJson<String>(url),
    };
  }

  BkmItemData copyWith({int? id, String? pagename, String? url}) => BkmItemData(
        id: id ?? this.id,
        pagename: pagename ?? this.pagename,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('BkmItemData(')
          ..write('id: $id, ')
          ..write('pagename: $pagename, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pagename, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BkmItemData &&
          other.id == this.id &&
          other.pagename == this.pagename &&
          other.url == this.url);
}

class BkmItemCompanion extends UpdateCompanion<BkmItemData> {
  final Value<int> id;
  final Value<String> pagename;
  final Value<String> url;
  const BkmItemCompanion({
    this.id = const Value.absent(),
    this.pagename = const Value.absent(),
    this.url = const Value.absent(),
  });
  BkmItemCompanion.insert({
    this.id = const Value.absent(),
    this.pagename = const Value.absent(),
    this.url = const Value.absent(),
  });
  static Insertable<BkmItemData> custom({
    Expression<int>? id,
    Expression<String>? pagename,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pagename != null) 'pagename': pagename,
      if (url != null) 'url': url,
    });
  }

  BkmItemCompanion copyWith(
      {Value<int>? id, Value<String>? pagename, Value<String>? url}) {
    return BkmItemCompanion(
      id: id ?? this.id,
      pagename: pagename ?? this.pagename,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pagename.present) {
      map['pagename'] = Variable<String>(pagename.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BkmItemCompanion(')
          ..write('id: $id, ')
          ..write('pagename: $pagename, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $BkmItemTable extends BkmItem with TableInfo<$BkmItemTable, BkmItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BkmItemTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pagenameMeta = const VerificationMeta('pagename');
  @override
  late final GeneratedColumn<String?> pagename =
      GeneratedColumn<String?>('pagename', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: const StringType(),
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url =
      GeneratedColumn<String?>('url', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: const StringType(),
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, pagename, url];
  @override
  String get aliasedName => _alias ?? 'bkm_item';
  @override
  String get actualTableName => 'bkm_item';
  @override
  VerificationContext validateIntegrity(Insertable<BkmItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pagename')) {
      context.handle(_pagenameMeta,
          pagename.isAcceptableOrUnknown(data['pagename']!, _pagenameMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BkmItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BkmItemData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BkmItemTable createAlias(String alias) {
    return $BkmItemTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BkmItemTable bkmItem = $BkmItemTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bkmItem];
}
