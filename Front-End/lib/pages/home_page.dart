import 'package:chat/pages/gps.dart';
import 'package:chat/pages/mealplan_page.dart';
import 'package:chat/pages/medicalrecord.dart';
import 'package:chat/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/custom_bottom_nav.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> imageList = [
    "assets/image01.jpg",
    "assets/image02.jpg",
    "assets/image03.jpg",
    "assets/image04.jpg",
  ];

  final List<String> imageTitles = [
    "Meal Plan",
    "Store",
    "Track My Pet",
    "Medical Record",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Home Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFB03E),
              fontSize: 29,
              fontFamily: 'CustomFont',
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1.0, // Remove the shadow
      ),
      body: Stack(
        children: [
          // Add images and paw prints code
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
                      return Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (imageTitles[index] == "Track My Pet") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GpsPage()),
                                  );
                                } else if (imageTitles[index] == "Store") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StorePage()),
                                  );
                                } else if (imageTitles[index] ==
                                    "Medical Record") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MedicalRecord()),
                                  );
                                } else if (imageTitles[index] ==
                                    "Meal Plan") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MealPlan()),
                                  );
                                }
                              },
                              child: Container(
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
                                      spreadRadius: 5,
                                      blurRadius: 3,
                                      offset: const Offset(5, 4.5),
                                    ),
                                  ],
                                ),
                                height: 180,
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
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }
}
