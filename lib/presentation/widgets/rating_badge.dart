import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class RatingBadge extends StatelessWidget {
  final double rating;

  const RatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD21F),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 20),
          const SizedBox(width: 5),
          Text(
            rating.toStringAsFixed(1),
            style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
