import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class SendReportScreen extends StatelessWidget {
  const SendReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Send Report',
      icon: Icons.send,
      iconColor: Color(0xFF4A90D9),
    );
  }
}
