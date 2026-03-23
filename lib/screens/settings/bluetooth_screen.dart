import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class BluetoothScreen extends StatelessWidget {
  const BluetoothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Bluetooth',
      icon: Icons.bluetooth,
      iconColor: Color(0xFF4A90D9),
    );
  }
}
