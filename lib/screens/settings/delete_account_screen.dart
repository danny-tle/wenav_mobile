import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitScreenLayout(
      title: 'Delete\nAccount',
      subtitle: 'This action is permanent and cannot\nbe undone.',
      backLabel: const Text('back'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Deleting your account will permanently remove all your data, including:',
            style: TextStyle(fontSize: 15, color: Color(0xFF555555), height: 1.5),
          ),
          const SizedBox(height: 16),
          _BulletItem('Your profile and account information'),
          _BulletItem('All recorded walks and navigation history'),
          _BulletItem('Caregiver connections and pairing codes'),
          _BulletItem('Incident reports and problem submissions'),
          const Spacer(),
          WeNavButton(
            label: 'Delete My Account',
            color: const Color(0xFFD93025),
            onTap: () => _confirmDelete(context),
          ),
          const SizedBox(height: 12),
          WeNavButton(
            label: 'Cancel',
            color: Colors.transparent,
            outlined: true,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This will permanently delete your account and all associated data.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Delete', style: TextStyle(color: Color(0xFFD93025))),
          ),
        ],
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String text;
  const _BulletItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 15, color: Color(0xFF555555))),
          Expanded(
            child: Text(text,
                style: const TextStyle(fontSize: 15, color: Color(0xFF555555), height: 1.4)),
          ),
        ],
      ),
    );
  }
}
