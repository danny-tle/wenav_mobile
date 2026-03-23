import 'package:flutter/material.dart';

enum ConnectionStatus { connected, disconnected, connecting, paused, searching, automatic }

extension ConnectionStatusExt on ConnectionStatus {
  Color get color {
    switch (this) {
      case ConnectionStatus.connected:
      case ConnectionStatus.automatic:
        return const Color(0xFF34C759);
      case ConnectionStatus.disconnected:
      case ConnectionStatus.paused:
        return const Color(0xFFFF3B30);
      case ConnectionStatus.connecting:
      case ConnectionStatus.searching:
        return const Color(0xFFFFCC00);
    }
  }

  String get label {
    switch (this) {
      case ConnectionStatus.connected:    return 'Connected';
      case ConnectionStatus.disconnected: return 'Disconnected';
      case ConnectionStatus.connecting:   return 'Connecting';
      case ConnectionStatus.paused:       return 'Paused';
      case ConnectionStatus.searching:    return 'Searching...';
      case ConnectionStatus.automatic:    return 'Automatic';
    }
  }
}

class StatusDot extends StatelessWidget {
  final ConnectionStatus status;
  final String? overrideLabel;

  const StatusDot({super.key, required this.status, this.overrideLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: status.color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          overrideLabel ?? status.label,
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ],
    );
  }
}
