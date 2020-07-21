import 'package:fluter_form/main.dart';
import 'package:fluter_form/screens/studentProfile.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController fullName = new TextEditingController();
  TextEditingController mobile = new TextEditingController();

  List<String> city = [
    "Dharan",
    "Biratnagar",
    "Kathmandu",
    "Bhaktapur",
    "Lalitpur"
  ];
  String selectedCity = "Dharan";
  String selectedGender = "male";

  bool isChecked = true;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Name field
              TextFormField(
                controller: fullName,
                decoration: InputDecoration(
                    labelText: "Full Name",
                    hintText: "Enter Your Full Name",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return "This field can not be empty";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),

              //Drop down city field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: DropdownButton(
                    underline: SizedBox(),
                    isExpanded: true,
                    value: selectedCity,
                    items: city.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.selectedCity = value;
                      });
                    }),
              ),
              SizedBox(
                height: 20.0,
              ),

              // mobile number field
              TextFormField(
                controller: mobile,
                decoration: InputDecoration(
                    hintText: "Enter Your mobile number",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return "This field can not be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Radio(
                            value: "male",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                this.selectedGender = value;
                              });
                            }),
                        Text("male"),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Radio(
                            value: "female",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                this.selectedGender = value;
                              });
                            }),
                        Text("female"),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            this.isChecked = value;
                          });
                        }),
                    Text("Flutter"),
                  ],
                ),
              ),

              Switch(
                value: darTheme,
                onChanged: (bool newValue) {
                  setState(() {
                    darTheme = newValue;
                  });
                },
              ),

              RaisedButton(
                child: Text('Register'),
                onPressed: () {
                  if (_globalKey.currentState.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentProfile(
                                  name: fullName.text,
                                  mobile: mobile.text,
                                  gender: selectedGender,
                                  city: selectedCity,
                                  course: isChecked,
                                )));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
