import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;
  const CustomTextButton({super.key, required this.icon, required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          //side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(145, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
