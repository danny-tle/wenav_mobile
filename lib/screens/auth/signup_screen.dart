import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitScreenLayout(
      title: 'Create an\naccount',
      subtitle: '',
      backLabel: const Text('login'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SsoButton(
            label: 'Continue with Google',
            leading: const Text('G',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4285F4))),
            onTap: () {},
          ),
          const SizedBox(height: 12),
          SsoButton(
            label: 'Continue with Apple',
            leading: const Icon(Icons.apple, size: 22),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('OR', style: TextStyle(color: Colors.grey[400], fontSize: 13)),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ]),
          const SizedBox(height: 20),
          const Text('Name', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          const WeNavTextField(hint: 'Enter your name', icon: Icons.person_outline),
          const SizedBox(height: 16),
          const Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          const WeNavTextField(hint: 'Enter your email', icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          const Text('Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          const WeNavTextField(hint: 'Enter your password', icon: Icons.lock_outline, obscure: true),
          const SizedBox(height: 28),
          WeNavButton(
            label: 'Log in',
            onTap: () => Navigator.pushNamed(context, '/verify-email'),
          ),
        ],
      ),
    );
  }
}
