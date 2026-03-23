import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class ConnectVestScreen extends StatelessWidget {
  const ConnectVestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Connect Vest',
      icon: Icons.bluetooth_connected,
      iconColor: Color(0xFF7B5EA7),
    );
  }
}
