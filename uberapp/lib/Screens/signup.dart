import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';


import 'package:uberapp/Widgets/customtextformfield.dart';
import 'package:uberapp/Widgets/customtextformfieldpass.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  dynamic? password;
  dynamic? mobileNumber;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: Text("Sign Up"),
        leading: IconButton(onPressed: () {
          // Get.to(context);
        },
          icon: Icon(Icons.arrow_back_ios),),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height / 12,),


              CustomTextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter your Mobile Number";
                  }
                  else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  mobileNumber = value;
                },
                hint: " mobileNumber",
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height / 50,),
              CustomTextFormFieldPass(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Password";
                  }
                  else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value;
                },
                hintText: "password",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height / 50,),
              MaterialButton(onPressed: () {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  SignUpapi(mobileNumber!, password!);
                }
              },
                color: Colors.teal,
                child: Text("Sign Up"),
              ),


            ],
          ),
        ),),
    );
  }

  Future<dynamic> SignUpapi(var mobileNumber, var password) async {
    var url = Uri.parse("uri");
    var response = await http.post(url,
        body: {
          "mobile Number": mobileNumber,
          "password": password,
        }
    );
    var responsebody = jsonDecode(response.body);
  }

}