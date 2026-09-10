import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const InfoItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFFFD21F),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 28),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
          ),

          if (label.isNotEmpty)
            Text(label, style: GoogleFonts.lato(fontSize: 11)),
        ],
      ),
    );
  }
}
