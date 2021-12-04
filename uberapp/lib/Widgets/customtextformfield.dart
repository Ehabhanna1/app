import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
 var validator;
 var keyboardType;
 var onSaved;
 String?  hint;
 CustomTextFormField({
   this.validator,
   this.keyboardType,
   this.onSaved,
   this.hint
});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        onSaved: onSaved ,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[400],
          hintText: hint,
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
