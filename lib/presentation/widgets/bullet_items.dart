import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletItem extends StatelessWidget {
  final String text;

  const BulletItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(Icons.circle, size: 8, color: Color(0xFFFFD21F)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.lato(fontSize: 15, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
