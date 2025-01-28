import 'package:chat/services/gemini_service.dart';
import 'package:flutter/material.dart';
import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/pages/userprofile_page.dart';
import 'package:flutter/widgets.dart';

class MealPlan extends StatefulWidget {
  MealPlan({Key? key}) : super(key: key);

  @override
  State<MealPlan> createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  String _mealPlan =
      "Enter your pet's details and press 'Check' to get a meal plan.";

  Future<void> _getMealPlan() async {
    final age = _ageController.text;
    final weight = _weightController.text;

    if (age.isEmpty || weight.isEmpty) {
      setState(() {
        _mealPlan = "Please fill in all fields.";
      });
      return;
    }

    final petDetails =
        "Age: $age years, Weight: $weight kg, Species: ${_speciesController.text}";

    try {
      setState(() {
        _mealPlan = "Generating meal plan...";
      });

      final geminiService = GeminiService();
      final generatedPlan = await geminiService.generateMealPlan(petDetails);

      setState(() {
        _mealPlan = generatedPlan!.replaceAll(RegExp(r'\*\*'), '').trim();
      });
    } catch (e) {
      setState(() {
        _mealPlan = "Failed to generate meal plan: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Meal Plan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffFFB03E),
            fontSize: 28,
            fontFamily: 'CustomFont',
          ),
        ),
        centerTitle: true, // Ensures title is centered.
        backgroundColor: Colors.transparent,
        elevation: 1.0,
      ),
      body: Stack(
        children: [
          // Background and paw elements (unchanged)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 75),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TextField(
                          controller: _ageController,
                          decoration: const InputDecoration(
                            labelText: 'Age',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _weightController,
                          decoration: const InputDecoration(
                            labelText: 'Weight',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _speciesController,
                          decoration: const InputDecoration(
                            labelText: 'Species',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: _getMealPlan,
                      child: Container(
                        height: 40,
                        width: 178,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffFFB03E),
                        ),
                        child: const Center(
                          child: Text(
                            "Check",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      _mealPlan,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StorePage()));
              },
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommunityPage()));
              },
              child: const Icon(Icons.people),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const userProfile()));
              },
              child: const Icon(Icons.account_circle),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
