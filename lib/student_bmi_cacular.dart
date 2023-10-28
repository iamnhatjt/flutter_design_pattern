import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/student.dart';

abstract class StudentBMICacular {
  const StudentBMICacular();

  List<Student> calculateBmiAndReturnStudentList() {
    var studentList = getstudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  void _calculateStudentsBmi(List<Student> studentList) {
    for (final student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / (height * height);
  }

  @protected
  List<Student> doStudentsFiltering(List<Student> listStudent) {
    return listStudent;
  }

  @protected
  List<Student> getstudentsData();
}
