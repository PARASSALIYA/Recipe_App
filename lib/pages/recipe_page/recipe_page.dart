import 'package:recipe_app/header.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    Map<String, dynamic> recipeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Page"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  recipeData['image'],
                ),
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Text(
                "${recipeData['name']}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: s.height * 0.004,
              ),
              Text(
                "Servings: ${recipeData['servings']}",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text(
                "Difficulty: ${recipeData['difficulty']}",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text(
                "Cuisine: ${recipeData['cuisine']}",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Text(
                "prepTimeMinutes & cookTimeMinutes: ${(recipeData['cookTimeMinutes'] + recipeData['prepTimeMinutes'])} Min",
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              Row(
                children: [
                  const Text("mealType: "),
                  ...List.generate(
                    recipeData['mealType'].length,
                    (index) => Text("${(recipeData['mealType'][index])}"),
                  ),
                ],
              ),
              const Text(
                "Ingredients: ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              ...List.generate(
                recipeData['ingredients'].length,
                (index) => Text("- ${(recipeData['ingredients'][index])}"),
              ),
              SizedBox(
                height: s.height * 0.003,
              ),
              const Text(
                "instructions: ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              ...List.generate(
                recipeData['ingredients'].length,
                (index) => Text("- ${(recipeData['ingredients'][index])}"),
              ),
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
          (mealList.contains(recipeData))
              ? mealList.remove(recipeData)
              : mealList.add(recipeData);

          setState(() {});
        },
        child: (mealList.contains(recipeData))
            ? const Icon(Icons.remove_shopping_cart_rounded)
            : const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
