import 'package:flutter/material.dart';

PreferredSizeWidget authAppbar(
    {required String title, required VoidCallback onClose}) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    centerTitle: true,
    leading: IconButton(
        onPressed: onClose,
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        )),
  );
}
