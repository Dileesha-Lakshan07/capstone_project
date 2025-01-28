import 'package:flutter/material.dart';

class PetMedicineMarketplacePage extends StatelessWidget {
  PetMedicineMarketplacePage({super.key});

  final List<Map<String, String>> petMedicineItems = [
    {
      "name": "Vitamin Supplements",
      "image": "assets/vitaminss.png",
      "price": "\$20"
    },
    {
      "name": "Deworming Tablets",
      "image": "assets/DewormingTablets.png",
      "price": "\$15"
    },
    {
      "name": "Flea Medicine",
      "image": "assets/FleaMedicine.png",
      "price": "\$22"
    },
    {
      "name": "Pain Relief Gel",
      "image": "assets/PainReliefGels.png",
      "price": "\$18"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Medicine Marketplace",
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
        itemCount: petMedicineItems.length,
        itemBuilder: (context, index) {
          final item = petMedicineItems[index];
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
