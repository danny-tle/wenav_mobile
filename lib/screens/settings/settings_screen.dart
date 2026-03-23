import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _voiceFeedback = true;
  bool _connectionStatus = true;
  bool _locationServices = true;
  bool _autoRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F7),
        elevation: 0,
        title: const Text('Home',
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        leading: const Icon(Icons.chevron_left, color: Colors.grey),
      ),
      body: ListView(
        children: [
          _SectionHeader('ACCESSIBILITY'),
          _SettingsGroup(tiles: [
            _ToggleTile(
              label: 'Voice feedback',
              value: _voiceFeedback,
              onChanged: (v) => setState(() => _voiceFeedback = v),
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(
              label: 'Speech speed',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(
              label: 'Vibration intensity',
              onTap: () {},
            ),
          ]),
          _SectionHeader('DEVICE SETTINGS'),
          _SettingsGroup(tiles: [
            _ToggleTile(
              label: 'Connection status',
              value: _connectionStatus,
              onChanged: (v) => setState(() => _connectionStatus = v),
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(label: 'Reconnect device', onTap: () {}),
            const Divider(height: 1, indent: 16),
            _ValueTile(label: 'Battery', value: '82%'),
          ]),
          _SectionHeader('PRIVACY & SHARING'),
          _SettingsGroup(tiles: [
            _ToggleTile(
              label: 'Location services',
              value: _locationServices,
              onChanged: (v) => setState(() => _locationServices = v),
            ),
            const Divider(height: 1, indent: 16),
            _ToggleTile(
              label: 'Auto recording',
              value: _autoRecording,
              onChanged: (v) => setState(() => _autoRecording = v),
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(
              label: 'Privacy policy',
              onTap: () => Navigator.pushNamed(context, '/settings/privacy-policy'),
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(
              label: 'Terms of service',
              onTap: () => Navigator.pushNamed(context, '/settings/terms'),
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(label: 'Delete my data', onTap: () {}, showChevron: false),
          ]),
          _SectionHeader('MY ACCOUNT'),
          _SettingsGroup(tiles: [
            _NavTile(
              label: 'Change password',
              onTap: () => Navigator.pushNamed(context, '/change-password'),
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(
              label: 'Delete my account',
              onTap: () => Navigator.pushNamed(context, '/settings/delete-account'),
              showChevron: false,
            ),
            const Divider(height: 1, indent: 16),
            _NavTile(
              label: 'Log out',
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
              showChevron: false,
            ),
          ]),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 6),
      child: Text(text,
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5)),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final List<Widget> tiles;
  const _SettingsGroup({required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(children: tiles),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleTile(
      {required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(label, style: const TextStyle(fontSize: 15)),
      activeThumbColor: Colors.black,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _NavTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool showChevron;
  const _NavTile(
      {required this.label, required this.onTap, this.showChevron = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: showChevron
          ? Icon(Icons.chevron_right, color: Colors.grey[400])
          : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _ValueTile extends StatelessWidget {
  final String label;
  final String value;
  const _ValueTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: Text(value, style: TextStyle(color: Colors.grey[500])),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
