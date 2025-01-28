import 'dart:io';
import 'package:chat/pages/community.dart';
import 'package:chat/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class PetRegistrationPage extends StatefulWidget {
  @override
  _PetRegistrationPageState createState() => _PetRegistrationPageState();
}

class _PetRegistrationPageState extends State<PetRegistrationPage> {
  final TextEditingController _birthdayController = TextEditingController();

  final petNameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final breedController = TextEditingController();

  bool isLoading = false;
  // pet registration method

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

void petRegistration() async {
  setState(() {
    isLoading = true; // Start the loading indicator
  });

  // Retrieve input values
  var petName = petNameController.text.trim();
  var weight = weightController.text.trim();
  // var height = heightController.text.trim();
  var breed = breedController.text.trim();
  var birthday = _birthdayController.text.trim();
  var gender = selectedGender;

  // Validate input fields
  if (petName.isEmpty ||
      weight.isEmpty ||
      // height.isEmpty ||
      breed.isEmpty ||
      birthday.isEmpty ||
      gender.isEmpty) {
    setState(() {
      isLoading = false;
    });
    showErrorDialog('Please fill all fields.');
    return;
  }

  try {
    // Get the current user ID
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      showErrorDialog("You need to be logged in to register a pet.");
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Reference to the user's document in Firestore
    DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);

    // Add the pet data to the 'pets' subcollection under the user document
    await userDoc.collection('pets').add({
      'pet_name': petName,
      'weight': weight,
      // 'height': height,
      'breed': breed,
      'birthday': birthday,
      'gender': gender,
      'created_at': FieldValue.serverTimestamp(),
    });

    setState(() {
      isLoading = false;
    });

    // Show success message or navigate to another screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pet registered successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Optionally, navigate to another screen after registration
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PetRegistrationPage()),
    );
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    showErrorDialog('An error occurred. Please try again.');
  }
}

  //error showing method
  void showErrorDialog(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  List<bool> breed = [true, false];
  String selectedGender = "F";
  List<bool> isSelected2 = [true, false];
  File? _image;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthdayController.text =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          // App Bar
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Pet Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffFFB03E),
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
                padding:
                    const EdgeInsets.all(70.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.3, // Adjust the opacity as needed for watermark effect
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
                padding:
                    const EdgeInsets.all(190.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
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
                padding:
                    const EdgeInsets.all(60.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
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
                padding:
                    const EdgeInsets.all(55.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
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
                padding:
                    const EdgeInsets.all(10.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ), // Background image or other elements can go here

            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _profilePic(context),
                  SizedBox(height: 20),
                  _nameField(context),
                  SizedBox(height: 20),
                  _birthdayField(context),
                  SizedBox(height: 20),
                  _genderToggle(context),
                  SizedBox(height: 20),
                  _statusToggle(context),
                  SizedBox(height: 10),
                  _weightField(context),
                  SizedBox(height: 20),
                  _breedField(context),
                  SizedBox(height: 20),
                  _actionButtons(context),
                ],
              ),
            ),
          ],
        ),
        extendBody: false,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 35,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {}, child: const Icon(Icons.home)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StorePage(),
                          ));
                    },
                    child: const Icon(Icons.shopping_cart)),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityPage(),
                          ));
                    },
                    child: const Icon(Icons.people)),
                label: 'People',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImage;
      },
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add_a_photo, size: 50),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return TextField(
      controller: petNameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _birthdayField(BuildContext context) {
    return TextField(
      controller: _birthdayController,
      decoration: const InputDecoration(
        labelText: 'Birthday',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }

  Widget _genderToggle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ToggleButtons(
          borderColor: Colors.orange,
          fillColor: Colors.orange,
          borderWidth: 1,
          selectedBorderColor: Colors.orange,
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(25),
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: breed,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < breed.length; i++) {
                breed[i] = i == index;
              }
              selectedGender = index == 0 ? "F" : "M";
            });
          },
          children: const <Widget>[
            Text("Female"),
            Text("Male"),
          ],
        ),
      ],
    );
  }

  Widget _statusToggle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Primary Vaccination Status',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ToggleButtons(
          borderColor: Colors.orange,
          fillColor: Colors.orange,
          borderWidth: 1,
          selectedBorderColor: Colors.orange,
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(25),
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: isSelected2,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected2.length; i++) {
                isSelected2[i] = i == index;
              }
            });
          },
          children: const <Widget>[
            Text("Yes"),
            Text("No"),
          ],
        ),
      ],
    );
  }

  Widget _weightField(BuildContext context) {
    return TextField(
      controller: weightController,
      decoration: const InputDecoration(
        labelText: 'Weight (Kg)',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _heightField(BuildContext context) {
    return TextField(
      controller: heightController,
      decoration: const InputDecoration(
        labelText: 'Height (cm)',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _breedField(BuildContext context) {
    return TextField(
      controller: breedController,
      decoration: const InputDecoration(
        labelText: 'Breed',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 170.0,
          height: 35, // Set the width here
          child: ElevatedButton(
            onPressed: () {
              // Handle back action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius here
              ),
            ),
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: 170.0,
          height: 35, // Set the width here
          child: ElevatedButton(
            onPressed: petRegistration,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius here
              ),
            ),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
