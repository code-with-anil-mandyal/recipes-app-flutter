import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../viewmodels/recipe_search_view_model.dart';
import '../widgets/recipe_card.dart';
import '../../presentation/widgets/shimmers/recipe_card_shimmer.dart';

class RecipeSearchScreen extends ConsumerStatefulWidget {
  const RecipeSearchScreen({super.key});

  @override
  ConsumerState<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends ConsumerState<RecipeSearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search() {
    ref
        .read(recipeSearchViewModelProvider.notifier)
        .search(_searchController.text);
  }

  void _clearSearch() {
    _searchController.clear();

    ref.read(recipeSearchViewModelProvider.notifier).clearSearch();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeSearchViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Recipes',
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Search field
                    TextField(
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (_) => _search(),
                      onChanged: (_) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Search recipes...',
                        hintStyle: GoogleFonts.lato(color: Colors.black45),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.black54,
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: _clearSearch,
                                icon: const Icon(Icons.close_rounded),
                              )
                            : null,
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                            color: Color(0xFFFFD21F),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Loading
            if (state.isLoading)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return const RecipeCardShimmer();
                  }, childCount: 6),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.72,
                  ),
                ),
              )
            // Results
            else if (state.recipes.isNotEmpty)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                sliver: SliverGrid(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.72,
                  ),
                ),
              )
            // Empty state
            else
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search_rounded,
                          size: 64,
                          color: Colors.black26,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.query.isEmpty
                              ? 'Search for a recipe'
                              : 'No recipes found',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.query.isEmpty
                              ? 'Try searching for pizza, pasta, chicken...'
                              : 'Try searching with a different name.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
