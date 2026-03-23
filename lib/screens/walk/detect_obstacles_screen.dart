import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class DetectObstaclesScreen extends StatelessWidget {
  const DetectObstaclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Detect Obstacles',
      icon: Icons.warning_amber_rounded,
      iconColor: Color(0xFF4A90D9),
    );
  }
}
