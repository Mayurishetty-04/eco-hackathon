import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('System Preferences', style: GoogleFonts.syncopate(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 32),
          GlassContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('User Profile', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Facility Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Region Protocol Code',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                const Text('API & Hardware', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Enable IoT Camera Connectivity', style: TextStyle(color: Colors.white54, fontSize: 16)),
                    Switch(value: true, activeColor: neonGreen, onChanged: (v) {}),
                  ],
                ),
                const Divider(color: Colors.white12, height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Real-time Blockchain Syncing', style: TextStyle(color: Colors.white54, fontSize: 16)),
                    Switch(value: true, activeColor: neonGreen, onChanged: (v) {}),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
