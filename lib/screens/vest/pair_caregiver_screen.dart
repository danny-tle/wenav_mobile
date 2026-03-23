import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class PairCaregiverScreen extends StatelessWidget {
  const PairCaregiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Pair with Caregiver',
      icon: Icons.people,
      iconColor: Color(0xFF7B5EA7),
    );
  }
}
