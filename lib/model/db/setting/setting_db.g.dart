// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SetIconAdapter extends TypeAdapter<SetIcon> {
  @override
  final int typeId = 2;

  @override
  SetIcon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SetIcon(
      fields[0] as int,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SetIcon obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.onoff);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetIconAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
