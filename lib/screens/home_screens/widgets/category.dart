import 'package:flutter/material.dart';

Widget makeCategoryEl(String title) {
  return Container(
    height: 40.0,
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Color(0xFFF0F2F5),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    ),
  );
}
