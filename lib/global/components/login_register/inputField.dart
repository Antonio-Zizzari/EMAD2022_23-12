import 'package:flutter/material.dart';

Widget inputField (String hintText, Color color) {
  return SizedBox(
    width: 300,
    height: 50,
    child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: color),
    ),
  );
}