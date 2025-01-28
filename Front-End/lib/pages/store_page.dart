import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/pet_belts_market.dart';
import 'package:chat/pages/pet_equipemnt_market.dart';
import 'package:chat/pages/pet_food_market.dart';
import 'package:chat/pages/pet_medicine_marketplace.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/custom_bottom_nav.dart'; // Import the CustomBottomNavBar widget

class StorePage extends StatelessWidget {
  StorePage({super.key});

  final List<String> imageList = [
    "assets/pet-food.jpg",
    "assets/pet-equepment.jpg",
    "assets/pet-collar.jpg",
    "assets/pet-medicine.jpg"
  ];

  final List<String> imageTitles = [
    "Pet-Food",
    "Pet-Equipment",
    "Pet-Belts",
    "Pet-Medicine"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Store",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFB03E).withOpacity(1),
              fontSize: 28,
              fontFamily: 'CustomFont',
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1.0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/foot.png",
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Opacity(
                opacity: 0.3,
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset(
                    'assets/paw.png',
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(190.0),
              child: Opacity(
                opacity: 0.4,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Opacity(
                opacity: 0.4,
                child: SizedBox(
                  height: 60,
                  width: 70,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: Opacity(
                opacity: 0.4,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Opacity(
                opacity: 0.4,
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 800,
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 100, 30, 40),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            // Navigate to Pet Food Marketplace
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PetFoodMarketplacePage()),
                            );
                          } else if (index == 1) {
                            // Navigate to Pet Equipment Marketplace
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PetEquipmentMarketplacePage()),
                            );
                          } else if (index == 2) {
                            // Navigate to Pet Belts Marketplace
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PetBeltsMarketplacePage()),
                            );
                          } else if (index == 3) {
                            // Navigate to Pet Belts Marketplace
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PetMedicineMarketplacePage()),
                            );
                          }
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 31, 172, 156),
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage(imageList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 0,
                                      offset: const Offset(5, 4.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              imageTitles[index],
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CustomFont',
                                color: Color.fromARGB(255, 134, 81, 7),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: imageList.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityPage()),
            );
          }
        },
      ),
    );
  }
}
