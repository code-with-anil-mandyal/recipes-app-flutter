import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFFD21F)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Icon(icon, size: 30, color: Colors.black),
            ),
            Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
