import 'package:flutter/material.dart';
import 'package:recipe_app/pages/utils/recipe.dart';
import 'package:recipe_app/pages/utils/routes.dart';

Widget homepage({
  required Size s,
}) {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          label: const Text("search"),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      SizedBox(
        height: s.height * 0.02,
      ),
      Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.8 / 6,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: recipe.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.detailpage,
                arguments: recipe[index],
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    recipe[index]['image'],
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "${recipe[index]['name']}",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                      "${recipe[index]['prepTimeMinutes']} - ${recipe[index]['cookTimeMinutes']} Min "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: s.height * 0.03,
                        width: s.width * 0.12,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${recipe[index]['rating']}⭐",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (BuildContext context,
                                void Function(void Function()) setState) =>
                            IconButton(
                          onPressed: () {
                            favoriteList.contains(recipe[index])
                                ? favoriteList.remove(recipe[index])
                                : favoriteList.add(recipe[index]);
                            setState(() {});
                          },
                          icon: (favoriteList.contains(recipe[index]))
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
