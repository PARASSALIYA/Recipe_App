import 'header.dart';

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
