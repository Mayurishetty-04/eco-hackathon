import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';
import 'widgets.dart';
import 'pages/dashboard_home_page.dart';
import 'pages/ai_analyzer_page.dart';
import 'pages/marketplace_page.dart';
import 'pages/wallet_page.dart';
import 'pages/heatmap_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const EcoSyncApp());
}

class EcoSyncApp extends StatelessWidget {
  const EcoSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoSync AI Control Panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgDark,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          primary: neonGreen,
          surface: panelColor,
          background: bgDark,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: Stack(
              children: [
                // Background decorative glowing orbs
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: neonGreen.withOpacity(0.15),
                          blurRadius: 200,
                          spreadRadius: 200,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -150,
                  left: 200,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.1),
                          blurRadius: 150,
                          spreadRadius: 150,
                        )
                      ],
                    ),
                  ),
                ),
                // Main Content View Switching
                IndexedStack(
                  index: _selectedIndex,
                  children: const [
                    DashboardHomeView(),
                    AiAnalyzerView(),
                    MarketplaceView(),
                    WalletView(),
                    HeatmapView(),
                    SettingsView(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        label: GlassContainer(
          borderRadius: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: neonGreen.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome, color: neonGreen, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('EcoSync AI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('How can I optimize waste?', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const Sidebar({super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: panelColor.withOpacity(0.5),
        border: Border(right: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                const Icon(Icons.eco, color: neonGreen, size: 32),
                const SizedBox(width: 12),
                Text(
                  'ECOSYNC',
                  style: GoogleFonts.syncopate(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _NavItem(icon: Icons.dashboard, title: 'Dashboard', isActive: selectedIndex == 0, onTap: () => onItemSelected(0)),
          _NavItem(icon: Icons.memory, title: 'AI Analyzer', isActive: selectedIndex == 1, onTap: () => onItemSelected(1)),
          _NavItem(icon: Icons.storefront, title: 'Marketplace', isActive: selectedIndex == 2, onTap: () => onItemSelected(2)),
          _NavItem(icon: Icons.account_balance_wallet, title: 'Wallet', isActive: selectedIndex == 3, onTap: () => onItemSelected(3)),
          _NavItem(icon: Icons.map, title: 'Heatmap', isActive: selectedIndex == 4, onTap: () => onItemSelected(4)),
          const Spacer(),
          _NavItem(icon: Icons.settings, title: 'Settings', isActive: selectedIndex == 5, onTap: () => onItemSelected(5)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({required this.icon, required this.title, this.isActive = false, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isActive 
                ? neonGreen.withOpacity(0.1) 
                : isHovered ? Colors.white.withOpacity(0.05) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isActive ? neonGreen.withOpacity(0.3) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon, 
                color: widget.isActive ? neonGreen : (isHovered ? Colors.white : Colors.white54),
                size: 22,
              ),
              const SizedBox(width: 16),
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.isActive ? neonGreen : (isHovered ? Colors.white : Colors.white54),
                  fontWeight: widget.isActive ? FontWeight.bold : FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
