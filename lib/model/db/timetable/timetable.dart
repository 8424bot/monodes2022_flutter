import 'package:hive/hive.dart';
part 'timetable.g.dart';

@HiveType(typeId : 0)
class TTable {
  @HiveField(0)
  String subject;
  @HiveField(1)
  String teacher;
  @HiveField(2)
  String result;
  @HiveField(3)
  String classroom;
  @HiveField(4)
  String teams;
  @HiveField(5)
  String slack;
  @HiveField(6)
  String outlook;
  @HiveField(7)
  String oit;
  @HiveField(8)
  // ignore: non_constant_identifier_names
  String c_larning;
  @HiveField(9)
  String other;

  TTable(
    this.subject, 
    this.teacher, 
    this.result, 
    this.classroom, 
    this.teams, 
    this.slack, 
    this.outlook, 
    this.oit, 
    this.c_larning,
    this.other
  );

  String tosubject() {
    return subject;
  }

  String toteacher() {
    return teacher;
  }

  String toresult() {
    return result;
  }

  List tourlList() {
    return[classroom, teams, slack, outlook, oit, c_larning, other];
  }
}