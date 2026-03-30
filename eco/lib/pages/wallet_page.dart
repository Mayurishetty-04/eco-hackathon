import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Carbon Integrity Wallet', style: GoogleFonts.syncopate(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: GlassContainer(
                  child: Column(
                    children: [
                      const Text('Current Balance', style: TextStyle(color: Colors.white54, fontSize: 18)),
                      const SizedBox(height: 16),
                      Text('14,450.00', style: GoogleFonts.spaceMono(color: neonGreen, fontSize: 48, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Verified CO2 Credits (CRD)', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: GlassContainer(
                  child: Column(
                    children: [
                      const Text('Total Rewards Redeemed', style: TextStyle(color: Colors.white54, fontSize: 18)),
                      const SizedBox(height: 16),
                      Text('\$3,200', style: GoogleFonts.spaceMono(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Via Eco Partners', style: TextStyle(color: neonGreen, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Transaction Ledger', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: GlassContainer(
              padding: EdgeInsets.zero,
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: const [
                  _TransactionRow(date: 'TODAY, 14:02', title: 'Recycled 50kg Plastics', amount: '+ 25 CRD', isPositive: true),
                  _TransactionRow(date: 'YESTERDAY, 09:12', title: 'Marketplace Dropoff', amount: '+ 110 CRD', isPositive: true),
                  _TransactionRow(date: 'MAR 22, 18:00', title: 'Redeemed Public Transport Pass', amount: '- 500 CRD', isPositive: false),
                  _TransactionRow(date: 'MAR 20, 11:20', title: 'AI Automation Bonus', amount: '+ 50 CRD', isPositive: true),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  final String date;
  final String title;
  final String amount;
  final bool isPositive;

  const _TransactionRow({required this.date, required this.title, required this.amount, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(isPositive ? Icons.add_circle_outline : Icons.remove_circle_outline, color: isPositive ? neonGreen : Colors.redAccent, size: 28),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(date, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ],
          ),
          Text(amount, style: GoogleFonts.spaceMono(color: isPositive ? neonGreen : Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
