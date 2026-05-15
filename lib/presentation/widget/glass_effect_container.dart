import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';

class GlassEffectContainer extends StatelessWidget {
  final Widget? child;

  const GlassEffectContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: containerBorderColor),
                    ),
                    child: child,
    );
  }
}