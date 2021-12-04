import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uberapp/Screens/signup.dart';
import 'package:uberapp/Widgets/customtextformfield.dart';
import 'package:uberapp/Widgets/customtextformfieldpass.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Login extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  dynamic? password;
  dynamic? mobileNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title:Text("Login"),

      ),
      body: Form(
        key:_formKey ,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/12,),
              CustomTextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter your Mobile Number";
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
                onSaved: (value){
                  mobileNumber=value;
                },
                hint:" mobileNumber",
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              CustomTextFormFieldPass(
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Password";
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  password=value;
                },
                hintText: "password",
                obscureText: true,
                keyboardType:TextInputType.visiblePassword ,
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              MaterialButton(onPressed: (){
                _formKey.currentState!.save();
                if(_formKey.currentState!.validate()){
                  loginapi(mobileNumber!,password!);
                 // ScaffoldMessenger.of(context).showSnackBar(Sna);
                  Get.to(SignUp);
                }
              },
                color: Colors.teal,
                child: Text("Login"),
              ),


            ],
          ),
        ),),
    );
  }

  Future<dynamic> loginapi(var mobileNumber,var password) async{

    var url=Uri.parse("uri");
    var response=await http.post(url,
        body: {
          "mobile Number":mobileNumber,
          "password":password,
        }
    );
    print("responsebody::${response.body}");

    var responsebody=jsonDecode(response.body)[""];
  }
}
