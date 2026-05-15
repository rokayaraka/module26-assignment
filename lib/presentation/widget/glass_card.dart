import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';
import 'package:module26assignment/presentation/widget/course_show_container.dart';
import 'package:module26assignment/presentation/widget/roll_show_container.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, 
    required this.name,
    required this.roll,
    required this.course1,
    required this.course2,
    required this.course3,
  });

  final String name;
  final String roll;
  final String course1;
  final String course2;
  final String course3;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child:  Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
               White18,Black18,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Black18,
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  const SizedBox(width: 14),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style:  TextStyle(
                            color: onlyWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Spacer(),
                        RollShowContainer(label: 'Roll', value: roll),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Courses',
                style: TextStyle(
                  color:White70,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 15,
                children: [
                  CourseShowContainer(course1),
                  CourseShowContainer(course2),
                  CourseShowContainer(course3),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}


