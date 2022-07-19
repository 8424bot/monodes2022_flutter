// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TTableAdapter extends TypeAdapter<TTable> {
  @override
  final int typeId = 0;

  @override
  TTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TTable(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TTable obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.teacher)
      ..writeByte(2)
      ..write(obj.room)
      ..writeByte(3)
      ..write(obj.classroom)
      ..writeByte(4)
      ..write(obj.teams)
      ..writeByte(5)
      ..write(obj.slack)
      ..writeByte(6)
      ..write(obj.outlook)
      ..writeByte(7)
      ..write(obj.portal)
      ..writeByte(8)
      ..write(obj.c_learning)
      ..writeByte(9)
      ..write(obj.other)
      ..writeByte(10)
      ..write(obj.partner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
