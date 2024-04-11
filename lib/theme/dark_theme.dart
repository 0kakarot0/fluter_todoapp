import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900, // Dark gray background
    primary: Colors.white, // White text
    secondary: Colors.grey.shade700, // Light gray secondary accent
    tertiary: Colors.grey.shade300, // Light gray tertiary accent
    inversePrimary: Colors.black, // Black inverse primary for text on light backgrounds
  ),
);
