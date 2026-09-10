import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const TopBarButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.black, size: 26),
      ),
    );
  }
}
