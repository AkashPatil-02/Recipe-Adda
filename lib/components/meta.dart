import 'package:flutter/material.dart';

class Meta extends StatelessWidget {
  final String label;
  final IconData icon; 
  const Meta({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}