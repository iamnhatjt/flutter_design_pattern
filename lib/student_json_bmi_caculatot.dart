import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/json_student_api.dart';
import 'package:flutter_design_pattern/student_bmi_cacular.dart';

import 'student.dart';

class StudentsJsonBmiCalculator extends StudentBMICacular {
  const StudentsJsonBmiCalculator({this.api = const JsonStudentsApi()});

  final JsonStudentsApi api;

  @override
  @protected
  List<Student> getStudentsData() {
    final studentsJson = api.getStudentsJson();
    final studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    final studentsJsonList = studentsMap['students'] as List;
    final studentsList = studentsJsonList.map((json) {
      final studentJson = json as Map<String, dynamic>;

      return Student(
        fullName: studentJson['fullName'] as String,
        age: studentJson['age'] as int,
        height: studentJson['height'] as double,
        weight: studentJson['weight'] as int,
      );
    }).toList();

    return studentsList;
  }
}
