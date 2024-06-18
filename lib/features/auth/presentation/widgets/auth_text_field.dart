import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final IconData? icon;
  final Function(String) onValueChanged;
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isPassword,
      this.icon,
      required this.onValueChanged});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  var _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        onChanged: widget.onValueChanged,
        obscureText: widget.isPassword ? _isObscured : false,
        decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: !widget.isPassword
                ? Icon(widget.icon ?? Icons.email)
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: !_isObscured
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off))),
      ),
    );
  }
}
