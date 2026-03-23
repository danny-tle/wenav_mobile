import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitScreenLayout(
      title: 'Forget\nPassword?',
      subtitle: "Don't worry, we will send you a\npassword reset link",
      backLabel: const Text('back'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          const WeNavTextField(
              hint: 'Enter your email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 28),
          WeNavButton(label: 'Send', onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
