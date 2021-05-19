import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
      primaryColor: Color(0xFFC1007E),
      accentColor: Color(
        0xFF919191,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
