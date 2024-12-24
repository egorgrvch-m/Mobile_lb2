import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentItem extends StatelessWidget {
  final Student student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color genderColor = student.gender == Gender.male
        ? Colors.green[100]!
        : Colors.purple[100]!;

    return Container(
      color: genderColor,
      child: ListTile(
        leading: Icon(departmentIcons[student.department]),
        title: Text('${student.firstName} ${student.lastName}'),
        subtitle: Text('Grade: ${student.grade}'),
        trailing: Text(student.gender == Gender.male ? 'Male' : 'Female'),
      ),
    );
  }
}
