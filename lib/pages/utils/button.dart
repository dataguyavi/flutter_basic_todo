import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.orangeAccent.shade400)
        ), 
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}