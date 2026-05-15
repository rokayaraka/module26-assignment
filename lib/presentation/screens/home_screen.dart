import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module26assignment/presentation/widget/app_background_container.dart';
import 'package:module26assignment/presentation/widget/circle_widget.dart';
import 'package:module26assignment/presentation/widget/glass_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _studentCollectionName = 'students';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: AppBackgroundContainer(
          child: Stack(
            children: [
              Positioned(top: 80, right: -60, child: circleWidget(180)),
              Positioned(bottom: 150, left: -60, child: circleWidget(130)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Student Info',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection(_studentCollectionName)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }

                          final docs = snapshot.data?.docs ?? [];
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: docs.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final data = docs[index].data();
                              return GlassCard(
                                name: data['name']?.toString() ?? 'Null',
                                roll: data['roll']?.toString() ?? 'Null',
                                course1: data['course1']?.toString() ?? '-',
                                course2: data['course2']?.toString() ?? '-',
                                course3: data['course3']?.toString() ?? '-',
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
