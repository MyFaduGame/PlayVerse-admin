import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const CustomRow({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    this.valueStyle = const TextStyle(
      fontSize: 16,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}
