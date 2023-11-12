import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  final String message;
  const ErrWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: const Color.fromARGB(255, 214, 139, 139),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
          maxLines: 2,
        ),
      ),
    );
  }
}
