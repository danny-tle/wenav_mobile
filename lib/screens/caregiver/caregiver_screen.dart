import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class CaregiverScreen extends StatelessWidget {
  const CaregiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: const Text('Home', style: TextStyle(color: Colors.grey, fontSize: 16)),
        leading: const Icon(Icons.chevron_left, color: Colors.grey),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Caregiver',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  "You haven't add any caregiver yet. Add a partner by tapping the button below.",
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: WeNavButton(
          label: 'Add Caregiver',
          color: kDark,
          onTap: () => Navigator.pushNamed(context, '/caregiver/pairing-code'),
        ),
      ),
    );
  }
}
