import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    {Color backgroundColor = Colors.black, int durationSeconds = 2}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: durationSeconds),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String capitalizeFirstLetter(String word) {
  if (word.isEmpty) {
    return word;
  }
  return word[0].toUpperCase() + word.substring(1);
}
