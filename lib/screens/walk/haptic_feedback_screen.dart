import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class HapticFeedbackScreen extends StatelessWidget {
  const HapticFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Trigger Haptic Feedback',
      icon: Icons.vibration,
      iconColor: Color(0xFF4A90D9),
    );
  }
}
