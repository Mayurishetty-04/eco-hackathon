import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets.dart';

class HeatmapView extends StatelessWidget {
  const HeatmapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Global Predictor Mapping', style: GoogleFonts.syncopate(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 24),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://snazzy-maps-cdn.azureedge.net/assets/74-micro.png?v=20170626083204'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(top: 200, left: 300, child: HeatmapSpot(color: Colors.redAccent, size: 150)),
                  const Positioned(top: 400, right: 300, child: HeatmapSpot(color: neonGreen, size: 200)),
                  const Positioned(bottom: 200, left: 500, child: HeatmapSpot(color: Colors.yellowAccent, size: 100)),
                  
                  Positioned(
                    top: 24,
                    right: 24,
                    child: GlassContainer(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(width: 12, height: 12, color: Colors.redAccent),
                              const SizedBox(width: 8),
                              const Text('Critical Overflow', style: TextStyle(color: Colors.white54)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(width: 12, height: 12, color: Colors.yellowAccent),
                              const SizedBox(width: 8),
                              const Text('Moderate Warning', style: TextStyle(color: Colors.white54)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(width: 12, height: 12, color: neonGreen),
                              const SizedBox(width: 8),
                              const Text('Optimal Flow', style: TextStyle(color: Colors.white54)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
