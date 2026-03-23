import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class AddCaregiverOnboardingScreen extends StatelessWidget {
  const AddCaregiverOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text('skip',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const Spacer(),
              const Text('Add a\nCaregiver',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1.2)),
              const SizedBox(height: 16),
              const Text('Generate a pairing code to share with\nyour caregiver.',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const Spacer(flex: 3),
              WeNavButton(
                label: 'Generate Code',
                color: kDark,
                onTap: () => Navigator.pushNamed(context, '/caregiver/pairing-code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
