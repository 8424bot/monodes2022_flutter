// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bkm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BkmStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<BkmItemData> get bkmItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BkmStateDataCopyWith<BkmStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BkmStateDataCopyWith<$Res> {
  factory $BkmStateDataCopyWith(
          BkmStateData value, $Res Function(BkmStateData) then) =
      _$BkmStateDataCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isReadyData, List<BkmItemData> bkmItems});
}

/// @nodoc
class _$BkmStateDataCopyWithImpl<$Res> implements $BkmStateDataCopyWith<$Res> {
  _$BkmStateDataCopyWithImpl(this._value, this._then);

  final BkmStateData _value;
  // ignore: unused_field
  final $Res Function(BkmStateData) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? bkmItems = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      bkmItems: bkmItems == freezed
          ? _value.bkmItems
          : bkmItems // ignore: cast_nullable_to_non_nullable
              as List<BkmItemData>,
    ));
  }
}

/// @nodoc
abstract class _$$_BkmStateDataCopyWith<$Res>
    implements $BkmStateDataCopyWith<$Res> {
  factory _$$_BkmStateDataCopyWith(
          _$_BkmStateData value, $Res Function(_$_BkmStateData) then) =
      __$$_BkmStateDataCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isReadyData, List<BkmItemData> bkmItems});
}

/// @nodoc
class __$$_BkmStateDataCopyWithImpl<$Res>
    extends _$BkmStateDataCopyWithImpl<$Res>
    implements _$$_BkmStateDataCopyWith<$Res> {
  __$$_BkmStateDataCopyWithImpl(
      _$_BkmStateData _value, $Res Function(_$_BkmStateData) _then)
      : super(_value, (v) => _then(v as _$_BkmStateData));

  @override
  _$_BkmStateData get _value => super._value as _$_BkmStateData;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? bkmItems = freezed,
  }) {
    return _then(_$_BkmStateData(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      bkmItems: bkmItems == freezed
          ? _value._bkmItems
          : bkmItems // ignore: cast_nullable_to_non_nullable
              as List<BkmItemData>,
    ));
  }
}

/// @nodoc

class _$_BkmStateData implements _BkmStateData {
  _$_BkmStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<BkmItemData> bkmItems = const []})
      : _bkmItems = bkmItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<BkmItemData> _bkmItems;
  @override
  @JsonKey()
  List<BkmItemData> get bkmItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bkmItems);
  }

  @override
  String toString() {
    return 'BkmStateData(isLoading: $isLoading, isReadyData: $isReadyData, bkmItems: $bkmItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BkmStateData &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality().equals(other._bkmItems, _bkmItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_bkmItems));

  @JsonKey(ignore: true)
  @override
  _$$_BkmStateDataCopyWith<_$_BkmStateData> get copyWith =>
      __$$_BkmStateDataCopyWithImpl<_$_BkmStateData>(this, _$identity);
}

abstract class _BkmStateData implements BkmStateData {
  factory _BkmStateData(
      {final bool isLoading,
      final bool isReadyData,
      final List<BkmItemData> bkmItems}) = _$_BkmStateData;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isReadyData => throw _privateConstructorUsedError;
  @override
  List<BkmItemData> get bkmItems => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BkmStateDataCopyWith<_$_BkmStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TempBkmItemData {
  String get pagename => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempBkmItemDataCopyWith<TempBkmItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempBkmItemDataCopyWith<$Res> {
  factory $TempBkmItemDataCopyWith(
          TempBkmItemData value, $Res Function(TempBkmItemData) then) =
      _$TempBkmItemDataCopyWithImpl<$Res>;
  $Res call({String pagename, String url});
}

/// @nodoc
class _$TempBkmItemDataCopyWithImpl<$Res>
    implements $TempBkmItemDataCopyWith<$Res> {
  _$TempBkmItemDataCopyWithImpl(this._value, this._then);

  final TempBkmItemData _value;
  // ignore: unused_field
  final $Res Function(TempBkmItemData) _then;

  @override
  $Res call({
    Object? pagename = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      pagename: pagename == freezed
          ? _value.pagename
          : pagename // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TempBkmItemDataCopyWith<$Res>
    implements $TempBkmItemDataCopyWith<$Res> {
  factory _$$_TempBkmItemDataCopyWith(
          _$_TempBkmItemData value, $Res Function(_$_TempBkmItemData) then) =
      __$$_TempBkmItemDataCopyWithImpl<$Res>;
  @override
  $Res call({String pagename, String url});
}

/// @nodoc
class __$$_TempBkmItemDataCopyWithImpl<$Res>
    extends _$TempBkmItemDataCopyWithImpl<$Res>
    implements _$$_TempBkmItemDataCopyWith<$Res> {
  __$$_TempBkmItemDataCopyWithImpl(
      _$_TempBkmItemData _value, $Res Function(_$_TempBkmItemData) _then)
      : super(_value, (v) => _then(v as _$_TempBkmItemData));

  @override
  _$_TempBkmItemData get _value => super._value as _$_TempBkmItemData;

  @override
  $Res call({
    Object? pagename = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_TempBkmItemData(
      pagename: pagename == freezed
          ? _value.pagename
          : pagename // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TempBkmItemData implements _TempBkmItemData {
  _$_TempBkmItemData({this.pagename = '', this.url = ''});

  @override
  @JsonKey()
  final String pagename;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'TempBkmItemData(pagename: $pagename, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempBkmItemData &&
            const DeepCollectionEquality().equals(other.pagename, pagename) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pagename),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_TempBkmItemDataCopyWith<_$_TempBkmItemData> get copyWith =>
      __$$_TempBkmItemDataCopyWithImpl<_$_TempBkmItemData>(this, _$identity);
}

abstract class _TempBkmItemData implements TempBkmItemData {
  factory _TempBkmItemData({final String pagename, final String url}) =
      _$_TempBkmItemData;

  @override
  String get pagename => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TempBkmItemDataCopyWith<_$_TempBkmItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
