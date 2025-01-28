import 'package:flutter/material.dart';

class PetEquipmentMarketplacePage extends StatelessWidget {
  PetEquipmentMarketplacePage({super.key});

  final List<Map<String, String>> petEquipmentItems = [
    {"name": "Leash", "image": "assets/belts.jpg", "price": "\$15"},
    {"name": "Cage", "image": "assets/cagecage.png", "price": "\$50"},
    {"name": "Pet Bed", "image": "assets/bedd.png", "price": "\$30"},
    {"name": "Grooming Kit", "image": "assets/grooming.jpg", "price": "\$20"},
    {"name": "Pet Toys", "image": "assets/toy.jpg", "price": "\$10"},
    {"name": "nail Clippers", "image": "assets/nail.png", "price": "\$25"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Equipment Marketplace",
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
        itemCount: petEquipmentItems.length,
        itemBuilder: (context, index) {
          final item = petEquipmentItems[index];
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
