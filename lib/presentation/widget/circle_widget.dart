import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';

Widget circleWidget(double size){
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: circleWidgetColor,
    ),
  );
}