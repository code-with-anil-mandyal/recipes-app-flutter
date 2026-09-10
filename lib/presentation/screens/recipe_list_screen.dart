import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presentation/widgets/shimmers/recipe_card_shimmer.dart';
import '../../presentation/widgets/shimmers/category_shimmer.dart';
import '../../presentation/widgets/shimmers/title_shimmer.dart';
import '../widgets/category_card.dart';
import '../../data/recipe_category.dart';
import '../widgets/recipe_card.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/recipe_list_viewmodel.dart';

class RecipeListScreen extends ConsumerStatefulWidget {
  const RecipeListScreen({super.key});

  @override
  ConsumerState<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends ConsumerState<RecipeListScreen> {
  late final RecipeListViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = ref.read(recipeListViewModelProvider.notifier);

    Future.microtask(() {
      //ref.read(recipeListViewModelProvider.notifier).loadCategories();

      //viewModel.loadCategories();
      //viewModel.loadRecipes();
      viewModel.loadHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeListViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _RecipeHeaderDelegate(
                state.categories,
                viewModel,
                state.selectedCategory,
                state.isInitialLoading,
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              sliver: SliverToBoxAdapter(
                child: state.isInitialLoading
                    ? const TitleShimmer()
                    : Text(
                        'All Recipes',
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              sliver: state.isInitialLoading
                  ? SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return const RecipeCardShimmer();
                      }, childCount: 6),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.72,
                          ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final recipe = state.recipes[index];

                        return RecipeCard(
                          imageUrl: recipe.image,
                          name: recipe.name,
                          category: recipe.cuisine,
                          timeInMinutes:
                              recipe.prepTimeMinutes + recipe.cookTimeMinutes,
                          rating: recipe.rating,
                          recipe: recipe,
                        );
                      }, childCount: state.recipes.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.72,
                          ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecipeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<RecipeCategory> categories;
  final RecipeListViewModel viewModel;
  final String selectedCategory;
  final bool isInitialLoading;

  _RecipeHeaderDelegate(
    this.categories,
    this.viewModel,
    this.selectedCategory,
    this.isInitialLoading,
  );

  static const double _minHeight = 205;
  static const double _maxHeight = 420;

  @override
  double get minExtent => _minHeight;

  @override
  double get maxExtent => _maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Material(
      color: Colors.white,
      elevation: progress > 0.9 ? 4 : 0,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      child: LayoutBuilder(
        builder: (context, constraints) {
          //final height = constraints.maxHeight;

          return Stack(
            children: [
              // ==============================
              // EXPANDED CONTENT
              // ==============================

              Positioned(
                top: 20,
                left: 24,
                right: 24,
                child: Opacity(
                  opacity: 1 - progress,
                  child: Row(
                    children: [
                      _UserIcon(),

                      const Spacer(),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          size: 30,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Expanded greeting
              Positioned(
                top: 96,
                left: 24,
                right: 24,
                child: Opacity(
                  opacity: 1 - progress,
                  child: Text(
                    'Hello, Anil',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              // Main title
              Positioned(
                top: 128,
                left: 24,
                right: 24,
                child: Opacity(
                  opacity: 1 - progress,
                  child: Text(
                    'Make your own food,\nstay at home',
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              // Search bar
              Positioned(
                top: 220,
                left: 24,
                right: 24,
                child: Opacity(opacity: 1 - progress, child: _SearchBar()),
              ),

              // ==============================
              // COLLAPSED TOP BAR
              // ==============================
              Positioned(
                top: 10,
                left: 24,
                right: 24,
                child: Opacity(
                  opacity: progress,
                  child: Row(
                    children: [
                      _UserIcon(),

                      const SizedBox(width: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Hello,',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            'Anil',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 27,
                          color: Colors.black54,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          size: 29,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ==============================
              // CATEGORIES
              // ==============================
              Positioned(
                left: 24,
                right: 0,
                bottom: 12,
                height: 116,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: isInitialLoading ? 5 : categories.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    if (isInitialLoading) {
                      return const CategoryShimmer();
                    }

                    final category = categories[index];

                    return CategoryCard(
                      name: category.name,
                      icon: category.icon,
                      isSelected: category.name == selectedCategory,
                      onTap: () {
                        if (category.name == 'All') {
                          viewModel.loadRecipes();
                        } else {
                          viewModel.loadRecipesByTag(category.name);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _RecipeHeaderDelegate oldDelegate) {
    return true;
  }
}

// ==========================================
// USER ICON
// ==========================================

class _UserIcon extends StatelessWidget {
  const _UserIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.person, size: 28, color: Colors.black54),
    );
  }
}

// ==========================================
// SEARCH BAR
// ==========================================

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, size: 28, color: Colors.black54),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              'Search any recipe',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.black45),
            ),
          ),

          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.tune_rounded,
              size: 22,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
