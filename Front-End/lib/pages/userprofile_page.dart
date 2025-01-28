import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/loging_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/pages/community.dart';
import 'package:chat/pages/petregistration_page.dart';
import 'package:chat/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<userProfile> {
  int _currentIndex = 3;
  String? userName;
  String? email;
  List<DocumentSnapshot> pets = [];
  List<DocumentSnapshot> userPets = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchUserPets();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Fetch user data
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      setState(() {
        userName = userData['username'];
        email = userData['email'];
      });

      // Fetch pets data
      QuerySnapshot petsData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('pets')
          .get();

      setState(() {
        userPets = petsData.docs; // Store pets in the list
      });
    }
  }

  Future<void> fetchUserPets() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot petData = await FirebaseFirestore.instance
          .collection('pets')
          .where('user_id', isEqualTo: user.uid)
          .get();

      setState(() {
        pets = petData.docs;
      });
    }
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const login()),
    );
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StorePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityPage()),
        );
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 246, 244),
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFB03E),
              fontSize: 28,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: _logout,
              icon: const Icon(Icons.logout, color: Colors.black),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        "Hello, ${userName ?? 'Loading...'}",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        email ?? 'Loading...',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      _petCategory(),
                      const SizedBox(height: 20),
                      _petAdding(),
                      const SizedBox(height: 40), // Space for pets section
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Pets",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Display the list of pets as cards
                      ListView.builder(
                        shrinkWrap: true, // Prevent infinite height error
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: userPets.length,
                        itemBuilder: (context, index) {
                          return _petCard(userPets[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onNavBarTap,
        ),
      ),
    );
  }

  Widget _headerSection() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(
                "Hello, ${userName ?? 'Loading...'}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                email ?? 'Loading...',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _petCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Pets",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return _petCard(pets[index]);
          },
        ),
      ],
    );
  }

  Widget _petCard(DocumentSnapshot petData) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              petData['pet_name'] ??
                  'Unknown', // Updated to match "pet_name" in Firestore
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _petDetail("Breed", petData['breed'] ?? 'Unknown'),
                _petDetail("Gender", petData['gender'] ?? 'N/A'),
              ],
            ),
            const SizedBox(height: 8),
            _petDetail("Weight", "${petData['weight'] ?? 'N/A'} kg"),
            const SizedBox(height: 8),
            _petDetail("Birthday", petData['birthday'] ?? 'Unknown'),
          ],
        ),
      ),
    );
  }

  Widget _petDetail(String label, String value) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(value),
      ],
    );
  }

  _petCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select your pet category",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPetIcon('dog', 'assets/doglogo.png'),
            _buildPetIcon('cat', 'assets/catlogo.png'),
            _buildPetIcon('fish', 'assets/fishlogo.png'),
            _buildPetIcon('rabbit', 'assets/rabbitlogo.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildPetIcon(String type, String imagePath) {
    return GestureDetector(
      onTap: () => selectPetCategory(type),
      child: Container(
        width: 70,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xffF9E8BD),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(imagePath),
      ),
    );
  }

  _petAdding() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetRegistrationPage()),
          ),
          child: _petAddContainer("Add Your Pet", "assets/addaone.jpg"),
        ),
      ],
    );
  }

  Widget _petAddContainer(String title, String imagePath) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 249, 230, 160),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_circle_outline, size: 40, color: Colors.black),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectPetCategory(String typeOfPet) {
    // Implementation to update Firestore if needed
  }
}
