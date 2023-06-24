import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darktheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 89, 95, 99),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 89, 95, 99),
    primarySwatch: Colors.deepOrange,
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: Colors.deepOrange,
    // ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 89, 95, 99),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    )));

ThemeData lighttheme = ThemeData(
   // primarySwatch: Colors.deepOrange,
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: Colors.deepOrange,
    // ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )));
