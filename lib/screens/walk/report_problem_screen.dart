import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  final List<String> _options = [
    'Blocked Path',
    'Construction',
    'Uneven sidewalk',
    'Low obstacle',
    'Other',
  ];
  String? _selected = 'Construction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: const Text('Home',
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        leading: const Icon(Icons.chevron_left, color: Colors.grey),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [
                const Text('Report a problem',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text('What Happened?',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                RadioGroup<String>(
                  groupValue: _selected,
                  onChanged: (v) => setState(() => _selected = v),
                  child: Column(
                    children: _options
                        .map((opt) => Column(
                              children: [
                                RadioListTile<String>(
                                  value: opt,
                                  title: Text(opt),
                                  activeColor: Colors.black,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                const Divider(height: 1),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Address ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Current Location',
                        style: TextStyle(color: Colors.grey[400])),
                  ],
                ),
                const SizedBox(height: 4),
                Text('234 W Maple Dr, Salt Lake City, UT 84101, USA',
                    style: TextStyle(color: Colors.grey[400], fontSize: 13)),
                const Divider(height: 24),
                const Text('Describe the problem',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Material(
                  color: kDark,
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.headphones, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text('Tap to Record',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: WeNavButton(
          label: 'Submit Report',
          color: kPurple,
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
