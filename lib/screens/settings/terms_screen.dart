import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Terms of Service',
            style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Text(
          'Terms of Service\n\n'
          'Last updated: January 1, 2025\n\n'
          'Please read these Terms of Service carefully before using the WeNav mobile application.\n\n'
          'Acceptance of Terms\n\n'
          'By accessing and using WeNav, you accept and agree to be bound by the terms and provision of this agreement.\n\n'
          'Use of Service\n\n'
          'WeNav provides navigation assistance for users with visual impairments. The application is intended as an assistive tool and should not be used as the sole means of navigation.\n\n'
          'User Responsibilities\n\n'
          '• You are responsible for maintaining the security of your account.\n\n'
          '• You must not use the service for any unlawful purposes.\n\n'
          '• You agree not to attempt to reverse engineer any portion of the application.\n\n'
          'Limitation of Liability\n\n'
          'WeNav shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of or inability to use the service.',
          style: TextStyle(fontSize: 15, height: 1.6, color: Color(0xFF1C1C1E)),
        ),
      ),
    );
  }
}
