import 'package:flutter/material.dart';
import 'package:recipe_app/pages/utils/recipe.dart';

import '../utils/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    TextStyle textStyle = const TextStyle(
      fontSize: 28,
    );
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.recipepage, arguments: data);
            },
            child: const Icon(Icons.no_meals),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.mealpage);
            },
            child: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  data['image'],
                ),
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Text(
                "${data['name']}",
                style: textStyle,
              ),
              SizedBox(
                height: s.height * 0.004,
              ),
              const Text(
                "Cooking Detail",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Servings: ${data['servings']}",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text(
                "Difficulty: ${data['difficulty']}",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text(
                "Cuisine: ${data['cuisine']}",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text(
                "CaloriesPerServing: ${(data['caloriesPerServing'] * data['servings'])}",
              ),
              Row(
                children: [
                  const Text("MealType: "),
                  ...List.generate(
                    data['mealType'].length,
                    (index) => Text("${(data['mealType'][index])}"),
                  ),
                ],
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              const Text(
                "Cooking Time",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Prep Time Minutes: ${data['prepTimeMinutes']} Min",
              ),
              Text(
                "Cook Time Minutes: ${data['cookTimeMinutes']} Min",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text("Ingredients: ${(data['ingredients'].length)} "),
              Text("Instructions: ${(data['instructions'].length)}"),
              SizedBox(
                height: s.height * 0.003,
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (mealList.contains(data))
              ? mealList.remove(data)
              : mealList.add(data);

          setState(() {});
        },
        child: (mealList.contains(data))
            ? const Icon(Icons.remove_shopping_cart_rounded)
            : const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
