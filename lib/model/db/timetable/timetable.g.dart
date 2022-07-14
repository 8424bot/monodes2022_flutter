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
      subject: fields[0] as String,
      teacher: fields[1] as String,
      room: fields[2] as String,
      result: fields[3] as String,
      classroom: fields[4] as String,
      teams: fields[5] as String,
      slack: fields[6] as String,
      outlook: fields[7] as String,
      portal: fields[8] as String,
      c_learning: fields[9] as String,
      other: fields[10] as String,
      partner: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TTable obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.teacher)
      ..writeByte(2)
      ..write(obj.room)
      ..writeByte(3)
      ..write(obj.result)
      ..writeByte(4)
      ..write(obj.classroom)
      ..writeByte(5)
      ..write(obj.teams)
      ..writeByte(6)
      ..write(obj.slack)
      ..writeByte(7)
      ..write(obj.outlook)
      ..writeByte(8)
      ..write(obj.portal)
      ..writeByte(9)
      ..write(obj.c_learning)
      ..writeByte(10)
      ..write(obj.other)
      ..writeByte(11)
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
