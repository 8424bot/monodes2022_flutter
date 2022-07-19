// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

part 'timetable.g.dart';

@HiveType(typeId: 0)
class TTable {
  @HiveField(0)
  String subject;
  @HiveField(1)
  String teacher;
  @HiveField(2)
  String room;
  @HiveField(3)
  String classroom;
  @HiveField(4)
  String teams;
  @HiveField(5)
  String slack;
  @HiveField(6)
  String outlook;
  @HiveField(7)
  String portal;
  @HiveField(8)
  String c_learning;
  @HiveField(9)
  String other;
  @HiveField(10)
  String partner;

  TTable(
    this.subject,
    this.teacher,
    this.room,
    this.classroom,
    this.teams,
    this.slack,
    this.outlook,
    this.portal,
    this.c_learning,
    this.other,
    this.partner,
  );

  String toSubject() {
    return subject;
  }

  String toTeacher() {
    return teacher;
  }

  String toRoom() {
    return room;
  }

  List toUrlList() {
    return [classroom, teams, slack, outlook, portal, c_learning, other];
  }

  String toPartner() {
    return partner;
  }
}
