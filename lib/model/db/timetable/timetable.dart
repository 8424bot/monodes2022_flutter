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
  String result;
  @HiveField(4)
  String classroom;
  @HiveField(5)
  String teams;
  @HiveField(6)
  String slack;
  @HiveField(7)
  String outlook;
  @HiveField(8)
  String portal;
  @HiveField(9)
  String c_learning;
  @HiveField(10)
  String other;
  @HiveField(11)
  String partner;

  TTable({
    required this.subject,
    required this.teacher,
    required this.room,
    required this.result,
    required this.classroom,
    required this.teams,
    required this.slack,
    required this.outlook,
    required this.portal,
    required this.c_learning,
    required this.other,
    required this.partner,
  });

  String toSubject() {
    return subject;
  }

  String toTeacher() {
    return teacher;
  }

  String toRoom() {
    return room;
  }

  String toResult() {
    return result;
  }

  List toUrlList() {
    return [classroom, teams, slack, outlook, portal, c_learning, other];
  }

  String toPartner() {
    return partner;
  }
}
