import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';
import '../../widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text('Hi, User1',
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
                        children: [
                          _StartWalkButton(
                            onTap: () => Navigator.pushNamed(context, '/walk/recording'),
                          ),
                          const SizedBox(height: 12),
                          StatusCard(children: [
                            StatusRow(
                              label: 'Caregiver Connection',
                              status: const StatusDot(status: ConnectionStatus.disconnected),
                              onTap: () => Navigator.pushNamed(context, '/caregiver'),
                              showChevron: true,
                            ),
                          ]),
                          const SizedBox(height: 8),
                          StatusCard(children: [
                            StatusRow(
                              label: 'Vest Connection',
                              status: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const StatusDot(status: ConnectionStatus.connected),
                                  const SizedBox(height: 4),
                                  BatteryBar(percent: 0.80),
                                ],
                              ),
                            ),
                          ]),
                          const SizedBox(height: 8),
                          StatusCard(children: [
                            StatusRow(
                                label: 'Location Sharing',
                                status: const StatusDot(status: ConnectionStatus.paused)),
                            Divider(height: 1, color: Colors.grey[300]),
                            StatusRow(
                                label: 'Alert Mode',
                                status: const StatusDot(status: ConnectionStatus.automatic)),
                          ]),
                          const SizedBox(height: 8),
                          StatusCard(children: [
                            StatusRow(
                              label: 'Settings',
                              status: const SizedBox.shrink(),
                              onTap: () => Navigator.pushNamed(context, '/settings'),
                              showChevron: true,
                            ),
                          ]),
                          const SizedBox(height: 12),
                          WeNavButton(
                            label: 'Report a Problem',
                            color: Colors.red,
                            outlined: true,
                            onTap: () => Navigator.pushNamed(context, '/walk/report'),
                          ),
                          const SizedBox(height: 20),
                          Text('Report Submitted',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 12),
                          _ReportCard(
                            date: 'March 1, 2026 at 3:45 PM (MT)',
                            address: '1234 W Maple Dr, Salt Lake City, UT 84101, USA',
                            type: 'Unknown obstacle',
                            status: 'Not Confirmed',
                            statusColor: Colors.red,
                            onViewDetails: () => _showIncidentDetails(context),
                          ),
                          const SizedBox(height: 8),
                          _ReportCard(
                            date: 'January, 2026 at 10:45 PM (MT)',
                            address: '1234 W Maple Dr, Salt Lake City, UT 84101, USA',
                            type: 'Blocked path',
                            status: 'Approved',
                            statusColor: Colors.green,
                            onViewDetails: () => _showIncidentDetails(context),
                          ),
                          const SizedBox(height: 8),
                          _ReportCard(
                            date: 'December 31, 2025 at 12:45 AM (MT)',
                            address: '1234 W Maple Dr, Salt Lake City, UT 84101, USA',
                            type: 'Construction',
                            status: 'Under Review',
                            statusColor: Colors.orange,
                            onViewDetails: () => _showIncidentDetails(context),
                          ),
                        ],
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

  void _showIncidentDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => const _IncidentDetailsSheet(),
    );
  }
}

class _StartWalkButton extends StatelessWidget {
  final VoidCallback onTap;
  const _StartWalkButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPurple,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Text('Start Walking',
              style: TextStyle(
                  color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

// StatusCard, StatusRow, BatteryBar are shared via home_widgets.dart

class _ReportCard extends StatelessWidget {
  final String date;
  final String address;
  final String type;
  final String status;
  final Color statusColor;
  final VoidCallback onViewDetails;

  const _ReportCard({
    required this.date,
    required this.address,
    required this.type,
    required this.status,
    required this.statusColor,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F7),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          Text(address, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          Text(type, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(status,
                  style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13)),
              const Spacer(),
              GestureDetector(
                onTap: onViewDetails,
                child: Text('view details',
                    style: TextStyle(color: Colors.grey[400], fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IncidentDetailsSheet extends StatefulWidget {
  const _IncidentDetailsSheet();

  @override
  State<_IncidentDetailsSheet> createState() => _IncidentDetailsSheetState();
}

class _IncidentDetailsSheetState extends State<_IncidentDetailsSheet> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2))),
          ),
          const SizedBox(height: 12),
          const Text('Incident Details',
              style: TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 4),
          const Text('March 1, 2026 at 3:45 PM (MT)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          const SizedBox(height: 12),
          if (!_expanded)
            Center(
              child: OutlinedButton(
                onPressed: () => setState(() => _expanded = true),
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: BorderSide(color: Colors.grey[300]!)),
                child: const Text('Show more',
                    style: TextStyle(color: Colors.black87)),
              ),
            ),
          if (_expanded) ...[
            const Divider(),
            const Text('Location',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 8),
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Icon(Icons.map, color: Colors.grey, size: 40)),
            ),
            const SizedBox(height: 8),
            const Text('Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text('1234 W Maple Dr, Salt Lake City,\nUT 84101, USA',
                style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          ],
          const Divider(),
          _DetailRow(
              label: 'Type', value: 'Under construction', valueColor: Colors.grey),
          const Divider(),
          _DetailRow(
              label: 'Status', value: 'Not confirmed', valueColor: Colors.red),
          const SizedBox(height: 4),
          const Text('Reason',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text('Insufficient information to verify the reported obstacle.',
              style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          const SizedBox(height: 24),
          WeNavButton(
              label: 'Close',
              color: kPurple,
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  const _DetailRow(
      {required this.label, required this.value, required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const Spacer(),
          Text(value, style: TextStyle(color: valueColor, fontSize: 14)),
        ],
      ),
    );
  }
}
