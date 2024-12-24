import 'package:flutter/material.dart';

enum Department { finance, law, it, medical }

enum Gender { male, female }

Map<Department, IconData> departmentIcons = {
  Department.finance: Icons.local_dining,
  Department.law: Icons.gavel,
  Department.it: Icons.computer,
  Department.medical: Icons.healing,
};

class Student {
  String firstName;
  String lastName;
  Department department;
  int grade;
  Gender gender;

  Student({
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  });
}
