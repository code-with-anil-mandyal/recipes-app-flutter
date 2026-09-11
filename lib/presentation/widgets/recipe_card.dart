import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/recipe_model.dart';
import '../../presentation/screens/recipe_detail_screen.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String category;
  final int timeInMinutes;
  final double rating;
  final RecipeModel recipe;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.timeInMinutes,
    required this.rating,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return RecipeDetailsScreen(recipe: recipe);
            },
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image
          // AspectRatio(
          //   aspectRatio: 1,
          //   child: Stack(
          //     children: [
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(24),
          //         child: SizedBox(
          //           width: double.infinity,
          //           height: 220,
          //           child: Hero(
          //             tag: 'recipe-image-${recipe.id}',
          //             child: Image.network(
          //               imageUrl,
          //               fit: BoxFit.cover,
          //               loadingBuilder: (context, child, loadingProgress) {
          //                 if (loadingProgress == null) {
          //                   return child;
          //                 }

          //                 return const Center(
          //                   child: SizedBox(
          //                     width: 28,
          //                     height: 28,
          //                     child: CircularProgressIndicator(
          //                       strokeWidth: 2.5,
          //                     ),
          //                   ),
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       ),

          //       // Cooking time
          //       Positioned(
          //         top: 14,
          //         left: 14,
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 12,
          //             vertical: 7,
          //           ),
          //           decoration: BoxDecoration(
          //             color: Colors.black.withValues(alpha: 0.45),
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               const Icon(
          //                 Icons.access_time_rounded,
          //                 size: 16,
          //                 color: Colors.white,
          //               ),
          //               const SizedBox(width: 5),
          //               Text(
          //                 '$timeInMinutes min',
          //                 style: GoogleFonts.lato(
          //                   fontSize: 12,
          //                   fontWeight: FontWeight.w500,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),

          //       // Rating
          //       Positioned(
          //         right: 12,
          //         bottom: 12,
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 11,
          //             vertical: 7,
          //           ),
          //           decoration: BoxDecoration(
          //             color: const Color(0xFFFFD21F),
          //             borderRadius: BorderRadius.circular(18),
          //           ),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               const Icon(
          //                 Icons.star_rounded,
          //                 size: 17,
          //                 color: Colors.black,
          //               ),
          //               const SizedBox(width: 4),
          //               Text(
          //                 rating.toStringAsFixed(1),
          //                 style: GoogleFonts.lato(
          //                   fontSize: 12,
          //                   fontWeight: FontWeight.w700,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Hero(
                  tag: 'recipe-image-${recipe.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox.expand(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return const Center(
                            child: SizedBox(
                              width: 28,
                              height: 28,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // cooking time...
                // rating...
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Recipe name
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 3),

          // Category
          Text(
            category,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
