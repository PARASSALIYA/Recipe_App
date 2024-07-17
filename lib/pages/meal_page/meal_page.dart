import 'package:flutter/material.dart';
import 'package:recipe_app/pages/utils/recipe.dart';
import 'package:recipe_app/pages/utils/routes.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int _totalcalories = 0;

  @override
  void initState() {
    // addTime();
    super.initState();
  }

  void addTime() {
    for (var e in mealList) {
      _totalcalories = e['caloriesPerServing'] * e['servings'];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Page"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Visibility(
                visible: mealList.isEmpty,
                child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    "Let's add your favorite meal",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mealList.length,
                  itemBuilder: (context, index) => Container(
                    height: s.height * 0.2,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.detailpage,
                          (route) => false,
                          arguments: mealList[index],
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.network(
                              mealList[index]['image'],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "${mealList[index]['name']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                      "${mealList[index]['prepTimeMinutes']} - ${mealList[index]['cookTimeMinutes']} Min ",
                                      style: textStyle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Cuisine: ${mealList[index]['cuisine']}",
                                    style: textStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: s.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (mealList[index]['servings'] > 0) {
                                          mealList[index]['servings']--;
                                        }
                                        if (mealList[index]['servings'] < 1) {
                                          mealList.remove(mealList[index]);
                                        }
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text("${mealList[index]['servings']}"),
                                    IconButton(
                                      onPressed: () {
                                        mealList[index]['servings']++;

                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const Alignment(0.9, -0.4),
                                  child: GestureDetector(
                                    onTap: () {
                                      mealList.remove(mealList[index]);
                                      mealList.remove;
                                      setState(() {});
                                    },
                                    child: const Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text("TotalTime: $_totalcalories"),
                    // Text("c : ${calories}"),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
