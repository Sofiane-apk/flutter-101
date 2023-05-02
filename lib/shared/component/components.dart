import 'package:flutter/material.dart';

Widget defaultButton({
  bool isUpperCASE = true,
  double width = double.infinity,
  double radius = 0.0,
  required String text,
  required Function function,
  Color Background = Colors.blueAccent,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: Background, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCASE ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultFormeField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword =false,
  required Function validate,
  required String label,
   IconData? suffix,
  required IconData prefix,
}) {
 
 
  return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit!(),
      onChanged: onChange!(),
      validator: validate(),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon:suffix !=null ? Icon(suffix): null,
        border: const OutlineInputBorder(),
      ),
    );
}

