import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class CustomTextFormFieldPass extends StatefulWidget {
 final String? hintText;
 var validator;
 var keyboardType;
 var onSaved;
 final String? helperText;
 final String? initialValue;
 var onEditingComplete;
 var textInputAction;
 bool obscureText;
 CustomTextFormFieldPass({
   this.hintText,
   this.validator,
   this.keyboardType,
   this.onSaved,
   this.helperText,
   this.initialValue="",
   this.onEditingComplete,
   this.textInputAction,
  this.obscureText=true,


 });
  @override
  _CustomTextFormFieldPassState createState() => _CustomTextFormFieldPassState();
}

class _CustomTextFormFieldPassState extends State<CustomTextFormFieldPass> {
  void _toggle(){
    setState(() {
      widget.obscureText= !widget.obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator:widget.validator,
        keyboardType:TextInputType.visiblePassword,
        onSaved:widget.onSaved,
        obscuringCharacter: "*",
        obscureText: widget.obscureText,

        decoration: InputDecoration(
          isDense: true,
          suffixIcon: FlatButton(onPressed: _toggle,
            child: Icon(Icons.remove_red_eye,
            color:widget.obscureText? Colors.black12:Colors.black54,
            ),
          
          ),
          filled: true,
          fillColor: Colors.grey[400],
          hintText:widget.hintText,
          helperStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),

        ),
      ),
    );
  }
}
