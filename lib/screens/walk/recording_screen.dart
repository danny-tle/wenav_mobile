import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../widgets/split_screen_layout.dart';
import '../../widgets/home_widgets.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  // Timer
  int _seconds = 0;
  Timer? _timer;

  // Camera
  CameraController? _cameraController;
  bool _cameraReady = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _seconds++);
    });
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;
    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _cameraController!.initialize();
    if (!mounted) return;
    setState(() => _cameraReady = true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  String get _elapsed {
    final m = _seconds ~/ 60;
    final s = _seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: _buildCameraView(),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: _buildControls(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView() {
    if (!_cameraReady) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(_cameraController!),

        // Recording indicator
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withAlpha(180),
                  Colors.transparent,
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Recording  $_elapsed',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Column(
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
              _StopWalkButton(
                elapsed: _elapsed,
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
              ),
              const SizedBox(height: 12),
              StatusCard(children: [
                StatusRow(
                  label: 'Caregiver Connection',
                  status:
                      const StatusDot(status: ConnectionStatus.connecting),
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
                      const StatusDot(status: ConnectionStatus.connecting),
                      const SizedBox(height: 4),
                      BatteryBar(percent: 0.21),
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 8),
              StatusCard(children: [
                StatusRow(
                    label: 'Location Sharing',
                    status: const StatusDot(
                        status: ConnectionStatus.searching)),
                Divider(height: 1, color: Colors.grey[300]),
                StatusRow(
                    label: 'Alert Mode',
                    status: const StatusDot(
                        status: ConnectionStatus.automatic)),
              ]),
              const SizedBox(height: 8),
              StatusCard(children: [
                StatusRow(
                  label: 'Settings',
                  status: const SizedBox.shrink(),
                  onTap: () =>
                      Navigator.pushNamed(context, '/settings'),
                  showChevron: true,
                ),
              ]),
              const SizedBox(height: 12),
              WeNavButton(
                label: 'Report a Problem',
                color: Colors.red,
                outlined: true,
                onTap: () =>
                    Navigator.pushNamed(context, '/walk/report'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Stop Walk Button ─────────────────────────────────────────────────────────

class _StopWalkButton extends StatelessWidget {
  final String elapsed;
  final VoidCallback onTap;
  const _StopWalkButton({required this.elapsed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kPurple, width: 1.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      child: Row(
        children: [
          const Text('Stop Walking',
              style: TextStyle(
                  color: kPurple,
                  fontSize: 17,
                  fontWeight: FontWeight.w600)),
          const Spacer(),
          Text(elapsed,
              style: const TextStyle(
                  color: kPurple,
                  fontSize: 17,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
