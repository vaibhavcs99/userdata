
import 'package:flutter/material.dart';

class UserDetailsRowWidget extends StatelessWidget {
  final String? title;
  final String? description;
  const UserDetailsRowWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 50,
            child: Text(
              '$title :',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 50,
            child: Text(
              description ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
