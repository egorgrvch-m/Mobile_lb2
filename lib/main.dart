import 'package:flutter/material.dart';
import 'models/student.dart';
import 'widgets/students.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Student> students = [
    Student(
        firstName: 'Ілля',
        lastName: 'Антипенко',
        department: Department.finance,
        grade: 90,
        gender: Gender.male),
    Student(
        firstName: 'Софія',
        lastName: 'Афромеєва',
        department: Department.law,
        grade: 85,
        gender: Gender.female),
    Student(
        firstName: 'Ростислав',
        lastName: 'Бибич',
        department: Department.it,
        grade: 95,
        gender: Gender.male),
    Student(
        firstName: 'Олексій',
        lastName: 'Гладких',
        department: Department.medical,
        grade: 88,
        gender: Gender.male),
    Student(
        firstName: 'Валерій',
        lastName: 'Гобод',
        department: Department.finance,
        grade: 76,
        gender: Gender.male),
    Student(
        firstName: 'Анастасія',
        lastName: 'Гойсак',
        department: Department.law,
        grade: 93,
        gender: Gender.female),
    Student(
        firstName: 'Дмитро',
        lastName: 'Дзюба',
        department: Department.it,
        grade: 91,
        gender: Gender.male),
    Student(
        firstName: 'Віталій',
        lastName: 'Донець',
        department: Department.medical,
        grade: 84,
        gender: Gender.male),
    Student(
        firstName: 'Святослав',
        lastName: 'Косенко',
        department: Department.finance,
        grade: 77,
        gender: Gender.male),
    Student(
        firstName: 'Арсеній',
        lastName: 'Лазарев',
        department: Department.law,
        grade: 89,
        gender: Gender.male),
    Student(
        firstName: 'Єгор',
        lastName: 'Малков',
        department: Department.it,
        grade: 93,
        gender: Gender.male),
    Student(
        firstName: 'Іван',
        lastName: 'Олексенко',
        department: Department.medical,
        grade: 81,
        gender: Gender.male),
    Student(
        firstName: 'Андрій',
        lastName: 'Омельницький',
        department: Department.finance,
        grade: 85,
        gender: Gender.male),
    Student(
        firstName: 'Олександр',
        lastName: 'Плис',
        department: Department.law,
        grade: 92,
        gender: Gender.male),
    Student(
        firstName: 'В`Ячеслав',
        lastName: 'Прохорчук',
        department: Department.it,
        grade: 78,
        gender: Gender.male),
    Student(
        firstName: 'Данііл',
        lastName: 'Романов',
        department: Department.medical,
        grade: 80,
        gender: Gender.male),
    Student(
        firstName: 'Євгеній',
        lastName: 'Степанян',
        department: Department.finance,
        grade: 94,
        gender: Gender.male),
    Student(
        firstName: 'Станіслав',
        lastName: 'Тотіков',
        department: Department.law,
        grade: 75,
        gender: Gender.male),
    Student(
        firstName: 'Владислава',
        lastName: 'Чайка',
        department: Department.it,
        grade: 88,
        gender: Gender.female),
    Student(
        firstName: 'Денис',
        lastName: 'Чухно',
        department: Department.medical,
        grade: 90,
        gender: Gender.male),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Students(students: students),
    );
  }
}
