import 'package:flutter/material.dart';
import 'split_screen_layout.dart';

export 'status_dot.dart';

class StatusCard extends StatelessWidget {
  final List<Widget> children;
  const StatusCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F7),
          borderRadius: BorderRadius.circular(14)),
      child: Column(children: children),
    );
  }
}

class StatusRow extends StatelessWidget {
  final String label;
  final Widget status;
  final VoidCallback? onTap;
  final bool showChevron;

  const StatusRow({
    super.key,
    required this.label,
    required this.status,
    this.onTap,
    this.showChevron = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            const Spacer(),
            status,
            if (showChevron) ...[
              const SizedBox(width: 6),
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 18),
            ],
          ],
        ),
      ),
    );
  }
}

class BatteryBar extends StatelessWidget {
  final double percent;
  const BatteryBar({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    final color = percent > 0.5
        ? Colors.green
        : percent > 0.2
            ? Colors.orange
            : Colors.red;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 60,
          height: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text('${(percent * 100).toInt()}%',
            style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }
}

/// The shared dark-header + white-sheet scaffold for Home and Recording screens.
class DashboardLayout extends StatelessWidget {
  final String headerText;
  final List<Widget> sheetChildren;

  const DashboardLayout({
    super.key,
    required this.headerText,
    required this.sheetChildren,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(headerText,
                  style: TextStyle(
                      color: Colors.white.withAlpha(180),
                      fontSize: 28,
                      fontWeight: FontWeight.w500)),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        children: sheetChildren,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
