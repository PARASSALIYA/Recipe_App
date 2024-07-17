import 'package:flutter/material.dart';
import 'package:recipe_app/pages/detail_page/detail_page.dart';
import 'package:recipe_app/pages/favorite_page/favorite_page.dart';
import 'package:recipe_app/pages/home_page/home_page.dart';
import 'package:recipe_app/pages/meal_page/meal_page.dart';
import 'package:recipe_app/pages/recipe_page/recipe_page.dart';
import 'package:recipe_app/pages/utils/routes.dart';

void main() {
  runApp(
    const RecipeApp(),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homepage: (context) => const HomePage(),
        Routes.detailpage: (context) => const DetailPage(),
        Routes.recipepage: (context) => const RecipePage(),
        Routes.mealpage: (context) => const MealPage(),
        Routes.favoritepage: (context) => const FavoritePage(),
      },
    );
  }
}
