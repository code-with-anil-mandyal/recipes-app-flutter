import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/recipe_model.dart';
import '../../presentation/widgets/direction_items.dart';
import '../../presentation/widgets/bullet_items.dart';
import '../../presentation/widgets/info_item.dart';
import '../../presentation/widgets/rating_badge.dart';
import '../../presentation/widgets/topbar_buttons.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final totalTime = recipe.prepTimeMinutes + recipe.cookTimeMinutes;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 380,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 4,
            surfaceTintColor: Colors.white,

            leading: TopBarButton(
              icon: Icons.arrow_back_rounded,
              onTap: () => Navigator.pop(context),
            ),

            actions: [
              TopBarButton(icon: Icons.bookmark_border_rounded, onTap: () {}),
              const SizedBox(width: 16),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: _HeroImage(recipe: recipe),
            ),
          ),

          SliverToBoxAdapter(
            child: _RecipeContent(recipe: recipe, totalTime: totalTime),
          ),
        ],
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final RecipeModel recipe;

  const _HeroImage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'recipe-image-${recipe.id}',
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
        child: Image.network(
          recipe.image,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }

            return const Center(
              child: SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RecipeContent extends StatelessWidget {
  final RecipeModel recipe;
  final int totalTime;

  const _RecipeContent({required this.recipe, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  recipe.name,
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              RatingBadge(rating: recipe.rating),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            recipe.cuisine,
            style: GoogleFonts.lato(fontSize: 16, color: Colors.black54),
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              Expanded(
                child: InfoItem(
                  icon: Icons.access_time_rounded,
                  value: '$totalTime',
                  label: 'mins',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InfoItem(
                  icon: Icons.people_alt_rounded,
                  value: '${recipe.servings}',
                  label: 'Servings',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InfoItem(
                  icon: Icons.local_fire_department_rounded,
                  value: '${recipe.caloriesPerServing}',
                  label: 'Cal',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InfoItem(
                  icon: Icons.layers_rounded,
                  value: recipe.difficulty,
                  label: '',
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Text(
            'Ingredients',
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 14),

          ...recipe.ingredients.map(
            (ingredient) => BulletItem(text: ingredient),
          ),

          const SizedBox(height: 30),

          Text(
            'Directions',
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 14),

          ...recipe.instructions.asMap().entries.map(
            (entry) => DirectionItem(number: entry.key + 1, text: entry.value),
          ),
        ],
      ),
    );
  }
}
