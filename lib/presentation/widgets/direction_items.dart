import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectionItem extends StatelessWidget {
  final int number;
  final String text;

  const DirectionItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD21F),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$number',
              style: GoogleFonts.lato(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.lato(fontSize: 15, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
