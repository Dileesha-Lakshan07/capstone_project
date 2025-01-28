import 'package:flutter/material.dart';

class PetBeltsMarketplacePage extends StatelessWidget {
  PetBeltsMarketplacePage({super.key});

  final List<Map<String, String>> petBeltsItems = [
    {"name": "Dog Collar", "image": "assets/dogcollars.png", "price": "\$10"},
    {"name": "Cat Harness", "image": "assets/catharness.jpg", "price": "\$15"},
    {
      "name": "Leather Leash",
      "image": "assets/leatherleash.png",
      "price": "\$35"
    },
    {
      "name": "Reflective Belt",
      "image": "assets/reflectivebelts.png",
      "price": "\$20"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Belts Marketplace",
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
        itemCount: petBeltsItems.length,
        itemBuilder: (context, index) {
          final item = petBeltsItems[index];
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
