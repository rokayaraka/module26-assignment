import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';

class CourseShowContainer extends StatelessWidget {
  const CourseShowContainer(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: White10,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color:White12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color:onlyWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
