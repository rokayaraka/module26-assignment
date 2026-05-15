import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';

class AppBackgroundContainer extends StatelessWidget {
  final Widget? child;

  const AppBackgroundContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
       height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: containerGradient,
          ),
        ),
        child: child,
    );
  }
}