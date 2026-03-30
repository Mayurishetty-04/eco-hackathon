import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets.dart';

class MarketplaceView extends StatelessWidget {
  const MarketplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.storefront, color: neonGreen, size: 36),
              const SizedBox(width: 16),
              Text('Global Circular Marketplace', style: GoogleFonts.syncopate(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: GlassContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Live Demands', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Expanded(child: ListView(
                          children: const [
                            MarketplaceItem(demand: 'Plastic Bottles (HDPE)', matchStr: '98%', status: 'Optimal Match'),
                            SizedBox(height: 8),
                            MarketplaceItem(demand: 'Cardboard Bulks', matchStr: '82%', status: 'Reviewing'),
                            SizedBox(height: 8),
                            MarketplaceItem(demand: 'Industrial Glass', matchStr: '45%', status: 'Low Match'),
                            SizedBox(height: 8),
                            MarketplaceItem(demand: 'Aluminum Cans', matchStr: '92%', status: 'Optimal Match'),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 2,
                  child: GlassContainer(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.recycling, size: 100, color: neonGreen.withOpacity(0.2)),
                          const SizedBox(height: 24),
                          const Text('Select a demand stream to view logistics.', style: TextStyle(color: Colors.white54, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
