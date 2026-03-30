import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets.dart';

class AiAnalyzerView extends StatelessWidget {
  const AiAnalyzerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(48.0),
        width: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Advanced AI Diagnostics', style: GoogleFonts.syncopate(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            const Text('Upload high-resolution scans or connect live camera feeds for precise defect and composition analysis.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, fontSize: 16)),
            const SizedBox(height: 48),
            GlassContainer(
              padding: const EdgeInsets.all(64),
              child: Column(
                children: [
                  Icon(Icons.document_scanner, size: 80, color: neonGreen.withOpacity(0.5)),
                  const SizedBox(height: 24),
                  const Text('Drop items here to scan', style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: neonGreen, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                    onPressed: () {},
                    child: const Text('Browse Files', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
