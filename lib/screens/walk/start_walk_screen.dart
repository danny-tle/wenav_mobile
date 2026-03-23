import 'package:flutter/material.dart';

class StartWalkScreen extends StatelessWidget {
  const StartWalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Walk'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  const Icon(Icons.directions_walk,
                      size: 72, color: Color(0xFF4A90D9)),
                  const SizedBox(height: 16),
                  Text(
                    'Start Walk',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Placeholder — coming soon',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Walk Sub-screens',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _SubScreenTile(
              label: 'Detect Obstacles',
              icon: Icons.warning_amber_rounded,
              color: const Color(0xFF4A90D9),
              onTap: () =>
                  Navigator.pushNamed(context, '/start-walk/detect-obstacles'),
            ),
            const SizedBox(height: 12),
            _SubScreenTile(
              label: 'Trigger Haptic Feedback',
              icon: Icons.vibration,
              color: const Color(0xFF4A90D9),
              onTap: () =>
                  Navigator.pushNamed(context, '/start-walk/haptic-feedback'),
            ),
            const SizedBox(height: 12),
            _SubScreenTile(
              label: 'Send Report',
              icon: Icons.send,
              color: const Color(0xFF4A90D9),
              onTap: () =>
                  Navigator.pushNamed(context, '/start-walk/send-report'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubScreenTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SubScreenTile({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: color.withAlpha(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon, color: color),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
