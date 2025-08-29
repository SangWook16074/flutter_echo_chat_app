import 'package:flutter/material.dart';

class InputTextField extends TextField {
  InputTextField({super.key, super.controller})
    : super(
        cursorColor: Color(0xff000000),
        decoration: InputDecoration(
          filled: true,

          fillColor: Color(0xffefefef),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      );
}
