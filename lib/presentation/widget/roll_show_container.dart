import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';
class RollShowContainer extends StatelessWidget {
  const RollShowContainer({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color:Black18,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: White12),
      ),
      child: Text(
        '$label: $value',
        style:  TextStyle(
          color: onlyWhite,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
