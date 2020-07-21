import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final String name;
  final String city;
  final String gender;
  final String mobile;
  final bool course;
  StudentProfile({this.name, this.city, this.gender, this.mobile, this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student profile'),
      ),
      body: Column(
        children: <Widget>[
          Text("Full name: $name"),
          Text("city: $city"),
          Text("mobile: $mobile"),
          Text("Gender: $gender"),
          Text("Course: $course"),
        ],
      ),
    );
  }
}
