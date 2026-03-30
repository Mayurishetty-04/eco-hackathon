import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme.dart';
import '../widgets.dart';

class DashboardHomeView extends StatelessWidget {
  const DashboardHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City Intelligence Matrix',
                    style: GoogleFonts.syncopate(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Live AI monitoring of urban waste flows & carbon offset.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: neonGreen.withOpacity(0.1),
                  border: Border.all(color: neonGreen.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.bolt, color: neonGreen, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'SYSTEM OPTIMAL',
                      style: GoogleFonts.spaceMono(
                        color: neonGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 32),
          
          const Row(
            children: [
              Expanded(child: MetricCard(title: 'Total Processed', value: '1.4M kg', change: '+12%', icon: Icons.recycling, isPositive: true)),
              SizedBox(width: 16),
              Expanded(child: MetricCard(title: 'Carbon Saved', value: '45,200 kg', change: '+8%', icon: Icons.co2, isPositive: true)),
              SizedBox(width: 16),
              Expanded(child: MetricCard(title: 'Active Matches', value: '342', change: '+34%', icon: Icons.handshake, isPositive: true)),
              SizedBox(width: 16),
              Expanded(child: MetricCard(title: 'User Score', value: '98/100', change: '+2', icon: Icons.star, isPositive: true)),
              SizedBox(width: 16),
              Expanded(child: MetricCard(title: 'Risk Index', value: '14%', change: '-5%', icon: Icons.warning_amber, isPositive: true, inverseColors: true)),
            ],
          ),
          const SizedBox(height: 32),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: const [
                    AIWasteIntelligencePanel(),
                    SizedBox(height: 24),
                    CarbonWalletPanel(),
                    SizedBox(height: 24),
                    AnalyticsPanel(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 5,
                child: Column(
                  children: const [
                    PredictiveHeatmapPanel(),
                    SizedBox(height: 24),
                    DynamicMarketplacePanel(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 3,
                child: Column(
                  children: const [
                    SmartAlertsPanel(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AIWasteIntelligencePanel extends StatelessWidget {
  const AIWasteIntelligencePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.psychology, color: neonGreen),
              SizedBox(width: 8),
              Text('AI Waste Intelligence', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_upload_outlined, color: Colors.white38, size: 40),
                        SizedBox(height: 8),
                        Text('Upload Image for Scan', style: TextStyle(color: Colors.white38)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                    color: neonGreen.withOpacity(0.05),
                    border: const Border(left: BorderSide(color: Colors.white12)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Result:', style: TextStyle(color: Colors.white54, fontSize: 12)),
                      Text('HDPE Plastic', style: TextStyle(color: neonGreen, fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 8),
                      Text('Action:', style: TextStyle(color: Colors.white54, fontSize: 12)),
                      Text('Redirect (Reuse)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [neonGreen.withOpacity(0.1), Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: neonGreen.withOpacity(0.3)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.auto_awesome, color: neonGreen, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Smart Recommendation', style: TextStyle(color: neonGreen, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(
                        'This plastic can be redirected to a local construction reuse unit instead of recycling, saving 23% more carbon.',
                        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, height: 1.4),
                      ),
                    ],
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

class CarbonWalletPanel extends StatelessWidget {
  const CarbonWalletPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.account_balance_wallet, color: neonGreen),
                  SizedBox(width: 8),
                  Text('Carbon Credit Wallet', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  border: Border.all(color: Colors.amber.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('Top 10% Contributor', style: TextStyle(color: Colors.amber, fontSize: 12, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('2,450', style: GoogleFonts.spaceMono(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('CRD', style: TextStyle(color: neonGreen, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 120,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 3.5), FlSpot(3, 5), FlSpot(4, 4), FlSpot(5, 6), FlSpot(6, 7),
                    ],
                    isCurved: true,
                    color: neonGreen,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [neonGreen.withOpacity(0.3), Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PredictiveHeatmapPanel extends StatelessWidget {
  const PredictiveHeatmapPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.map, color: neonGreen),
                    SizedBox(width: 8),
                    Text('Predictive Waste Heatmap', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: const [
                    ToggleBtn(title: 'Today', isActive: true),
                    SizedBox(width: 8),
                    ToggleBtn(title: 'Weekend'),
                    SizedBox(width: 8),
                    ToggleBtn(title: 'Festival'),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black26,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Opacity(
                    opacity: 0.2,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://snazzy-maps-cdn.azureedge.net/assets/74-micro.png?v=20170626083204'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 80,
                  left: 120,
                  child: HeatmapSpot(color: Colors.redAccent, size: 80),
                ),
                const Positioned(
                  top: 150,
                  right: 150,
                  child: HeatmapSpot(color: neonGreen, size: 60),
                ),
                const Positioned(
                  bottom: 60,
                  left: 200,
                  child: HeatmapSpot(color: Colors.yellowAccent, size: 100),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: bgDark.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Row(
                      children: [
                         Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle)),
                         const SizedBox(width: 8),
                         const Text('High Prediction', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
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

class DynamicMarketplacePanel extends StatelessWidget {
  const DynamicMarketplacePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.sync_alt, color: neonGreen),
                  SizedBox(width: 8),
                  Text('Circular Marketplace', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const Text('Auto-Cluster ON', style: TextStyle(color: neonGreen, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          const MarketplaceItem(demand: 'NGO needs 50kg cardboard nearby', matchStr: '98% Match', status: 'Optimal Match'),
          const SizedBox(height: 12),
          const MarketplaceItem(demand: 'Local Constructor needs bulk plastic', matchStr: '85% Match', status: 'Reviewing'),
          const SizedBox(height: 12),
          const MarketplaceItem(demand: 'Glass Manufacturer needs sorted cullet', matchStr: '62% Match', status: 'Pending Data'),
        ],
      ),
    );
  }
}

class SmartAlertsPanel extends StatelessWidget {
  const SmartAlertsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.notifications_active, color: neonGreen),
              SizedBox(width: 8),
              Text('Smart Alerts', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          const _AlertItem(
            text: 'Waste spike expected in your area this weekend.',
            icon: Icons.trending_up,
            color: Colors.orangeAccent,
          ),
          const SizedBox(height: 16),
          const _AlertItem(
            text: 'You can increase carbon credits by 18% by redirecting plastic waste.',
            icon: Icons.lightbulb,
            color: neonGreen,
          ),
          const SizedBox(height: 16),
          const _AlertItem(
            text: 'Logistics partner arriving at 14:00 today.',
            icon: Icons.local_shipping,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

class _AlertItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const _AlertItem({required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4)),
          ),
        ),
      ],
    );
  }
}

class AnalyticsPanel extends StatelessWidget {
  const AnalyticsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.pie_chart, color: neonGreen),
              SizedBox(width: 8),
              Text('Analytics', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Reuse vs Recycle', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(color: neonGreen, value: 65, title: '65%', radius: 30, titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: bgDark)),
                  PieChartSectionData(color: Colors.blueAccent, value: 25, title: '25%', radius: 25, titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                  PieChartSectionData(color: Colors.amber, value: 10, title: '10%', radius: 20, titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _LegendItem(color: neonGreen, title: 'Reuse'),
              SizedBox(width: 16),
              _LegendItem(color: Colors.blueAccent, title: 'Recycle'),
              SizedBox(width: 16),
              _LegendItem(color: Colors.amber, title: 'Landfill'),
            ],
          )
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String title;

  const _LegendItem({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
