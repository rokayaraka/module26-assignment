import 'package:flutter/material.dart';
import 'package:module26assignment/presentation/widget/app_background_container.dart';
import 'package:module26assignment/presentation/widget/circle_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final String _studentCollectionName = 'students';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Info.'),
        
      ),
      body: AppBackgroundContainer(
        child: Stack(
          children: [
              Positioned(top: 80, right: -60, child: circleWidget(180)),
              Positioned(bottom: 150, left: -60, child: circleWidget(130)),
          ],
        ),
      ),
    );
  }
}