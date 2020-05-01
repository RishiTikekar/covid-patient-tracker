import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './state_list_screen.dart';
import './district_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateListScreen(),
      title: 'Covid Tracker',
      theme: ThemeData(
        primaryColor: Color(0xFF111f28),
        canvasColor: Color(0xFF060607),
        textTheme: TextTheme(
          title: GoogleFonts.raleway(
            fontSize: 15.0,
            color: Color(0xffafb9c5),//Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          subtitle: GoogleFonts.raleway(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          button: GoogleFonts.raleway(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),

        ),
      ),
    );
  }
}
