import 'package:flutter/material.dart';

class PetFoodMarketplacePage extends StatelessWidget {
  PetFoodMarketplacePage({super.key});

  final List<Map<String, String>> petFoodItems = [
    {"name": "Dog Food", "image": "assets/dogfood.jpeg", "price": "\$25"},
    {"name": "Cat Food", "image": "assets/foodfrcats.png", "price": "\$20"},
    {"name": "Bird Food", "image": "assets/birdfood.png", "price": "\$15"},
    {"name": "Fish Food", "image": "assets/fishfeed.png", "price": "\$10"},
    {"name": "Rabbit Food", "image": "assets/rabbitfood.png", "price": "\$15"},
    {"name": "Pig Food", "image": "assets/pigfeed.png", "price": "\$18"},
    {
      "name": "Chicken Food",
      "image": "assets/chickenfeed.png",
      "price": "\$15"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Food Marketplace",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xffFFB03E),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.8,
        ),
        itemCount: petFoodItems.length,
        itemBuilder: (context, index) {
          final item = petFoodItems[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Image.asset(
                      item["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        item["name"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        item["price"]!,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
