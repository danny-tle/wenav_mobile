import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitScreenLayout(
      title: 'Welcome,\nLogin',
      subtitle: '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SsoButton(
            label: 'Continue with Google',
            leading: const _GoogleIcon(),
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
          const Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          const WeNavTextField(hint: 'Enter your email', icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          const Text('Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          const WeNavTextField(hint: 'Enter your password', icon: Icons.lock_outline, obscure: true),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/forgot-password'),
              child: Text('forgot password?',
                  style: TextStyle(color: Colors.grey[500], fontSize: 13)),
            ),
          ),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Not a member? ", style: TextStyle(color: Colors.grey[500])),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign up',
                  style: TextStyle(color: kPurple, fontWeight: FontWeight.w600)),
            ),
          ]),
          const SizedBox(height: 20),
          WeNavButton(label: 'Log in', onTap: () => Navigator.pushReplacementNamed(context, '/home')),
        ],
      ),
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();
  @override
  Widget build(BuildContext context) {
    return const Text('G',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4285F4)));
  }
}
