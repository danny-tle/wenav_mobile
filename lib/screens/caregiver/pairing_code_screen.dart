import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class PairingCodeScreen extends StatelessWidget {
  const PairingCodeScreen({super.key});

  static const _code = ['6', '9', '9', '6'];

  @override
  Widget build(BuildContext context) {
    return SplitScreenLayout(
      title: 'Your Pairing\nCode',
      subtitle: 'Share this code with your caregiver to\nconnect. This code expires in 5 minutes.',
      backLabel: const Text('back'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _code
                .map((digit) => _CodeBox(digit: digit))
                .toList(),
          ),
          const SizedBox(height: 28),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: const Text('Resend Code',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeBox extends StatelessWidget {
  final String digit;
  const _CodeBox({required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 78,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(digit,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
    );
  }
}
