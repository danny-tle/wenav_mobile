import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class DataSharingScreen extends StatelessWidget {
  const DataSharingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Data Sharing',
      icon: Icons.share,
      iconColor: Color(0xFF4A90D9),
    );
  }
}
