import 'package:flutter/material.dart';

final myDarkTheme = ThemeData(
  primarySwatch: Colors.yellow,
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  dividerColor: Colors.white24,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      )),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
);