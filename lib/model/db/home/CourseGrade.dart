// ignore_for_file: file_names

import 'package:hive/hive.dart';
part 'CourseGrade.g.dart';

@HiveType(typeId : 1)
class CG {
  @HiveField(0)
  String course;
  @HiveField(1)
  int grade;

  CG(this.course, this.grade);

  String tocourse() {
    return course;
  }
  int tograde() {
    return grade;
  }
}