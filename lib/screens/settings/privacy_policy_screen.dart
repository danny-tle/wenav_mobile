import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
        title: const Text('Privacy Policy',
            style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Text(
          'Privacy Policy\n\n'
          'Last updated: January 1, 2025\n\n'
          'WeNav is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.\n\n'
          'Information We Collect\n\n'
          'We may collect information about you in a variety of ways. The information we may collect via the Application includes:\n\n'
          '• Personal Data: Personally identifiable information, such as your name and email address, that you voluntarily give to us.\n\n'
          '• Location Data: We collect real-time information about the location of your device to provide navigation assistance.\n\n'
          '• Device Data: Information about your mobile device including device type, operating system, and connection information.\n\n'
          'How We Use Your Information\n\n'
          'We use the information we collect to provide, maintain, and improve our services, process transactions, send you technical notices, and respond to your comments and questions.',
          style: TextStyle(fontSize: 15, height: 1.6, color: Color(0xFF1C1C1E)),
        ),
      ),
    );
  }
}
