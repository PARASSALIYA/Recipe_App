import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page/widgets/home_page.dart';
import 'package:recipe_app/pages/utils/recipe.dart';
import 'package:recipe_app/pages/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxTime = 0;
  String mealType = "";

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("E-commerceApp"),
              accountEmail: const Text("e-commerceApp@gmail.com"),
              currentAccountPicture: Image.network(
                "https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png",
              ),
            ),
            // 10.height,
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "All Category",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.favoritepage);
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.mealpage);
            },
            child: const Icon(Icons.no_meals_sharp),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: homepage(s: s),
      ),
    );
  }
}

/*
  _filteredRecipes = widget.recipes.where((recipe) {
        return (tag.isEmpty || recipe.tags.contains(tag)) &&
               (mealType.isEmpty || recipe.mealType == mealType) &&
               (recipe.prepTime + recipe.cookTime <= maxTime);
      }).toList();
      */
