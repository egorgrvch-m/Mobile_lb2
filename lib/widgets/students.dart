import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';
import 'new_student.dart';

class Students extends StatefulWidget {
  final List<Student> students;

  const Students({Key? key, required this.students}) : super(key: key);

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  late List<Student> students;

  @override
  void initState() {
    super.initState();
    students = widget.students;
  }

  void _addStudent(Student newStudent) {
    setState(() {
      students.add(newStudent);
    });
  }

  void _editStudent(int index, Student updatedStudent) {
    setState(() {
      students[index] = updatedStudent;
    });
  }

  void _deleteStudent(int index) {
    final removedStudent = students[index];
    setState(() {
      students.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${removedStudent.firstName} removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              students.insert(index, removedStudent);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Dismissible(
            key: ValueKey(student),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => _deleteStudent(index),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return NewStudent(
                      student: student,
                      onSave: (updatedStudent) {
                        _editStudent(index, updatedStudent);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
              child: StudentItem(student: student),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return NewStudent(
                onSave: (newStudent) {
                  _addStudent(newStudent);
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
