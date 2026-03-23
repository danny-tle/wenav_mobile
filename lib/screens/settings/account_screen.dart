import 'package:flutter/material.dart';
import '../../widgets/placeholder_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Account',
      icon: Icons.person,
      iconColor: Color(0xFF4A90D9),
    );
  }
}
