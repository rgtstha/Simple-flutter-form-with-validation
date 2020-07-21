import 'package:fluter_form/screens/registerpage.dart';
import 'package:flutter/material.dart';

bool darTheme = false;
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: darTheme == true ? ThemeData.light() : ThemeData.dark(),
    ));
