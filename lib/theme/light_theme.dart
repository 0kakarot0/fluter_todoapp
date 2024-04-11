import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white, // Soft white background
    primary: Colors.black, // Black text
    secondary: Colors.grey.shade300, // Light gray secondary accent
    tertiary: Colors.grey.shade700, // Dark gray tertiary accent
    inversePrimary: Colors.white, // White inverse primary for text on dark backgrounds
  ),
);
