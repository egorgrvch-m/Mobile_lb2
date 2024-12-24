import 'package:flutter/material.dart';
import '../models/student.dart';

class NewStudent extends StatefulWidget {
  final Student? student;
  final void Function(Student) onSave;

  const NewStudent({Key? key, this.student, required this.onSave})
      : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  Department? _selectedDepartment;
  Gender? _selectedGender;
  int? _grade;

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _firstNameController.text = widget.student!.firstName;
      _lastNameController.text = widget.student!.lastName;
      _selectedDepartment = widget.student!.department;
      _selectedGender = widget.student!.gender;
      _grade = widget.student!.grade;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          DropdownButton<Department>(
            value: _selectedDepartment,
            hint: Text('Select Department'),
            items: Department.values.map((department) {
              return DropdownMenuItem(
                value: department,
                child: Text(department.toString().split('.').last),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDepartment = value!;
              });
            },
          ),
          DropdownButton<Gender>(
            value: _selectedGender,
            hint: Text('Select Gender'),
            items: Gender.values.map((gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(gender.toString().split('.').last),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Grade'),
            onChanged: (value) {
              _grade = int.tryParse(value);
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_firstNameController.text.isNotEmpty &&
                  _lastNameController.text.isNotEmpty &&
                  _selectedDepartment != null &&
                  _selectedGender != null &&
                  _grade != null) {
                widget.onSave(Student(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  department: _selectedDepartment!,
                  gender: _selectedGender!,
                  grade: _grade!,
                ));
                Navigator.of(context).pop();
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
