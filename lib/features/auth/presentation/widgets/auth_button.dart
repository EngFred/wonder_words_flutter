import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onClick;
  final String label;
  final IconData icon;
  const AuthButton(
      {super.key,
      required this.onClick,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}
