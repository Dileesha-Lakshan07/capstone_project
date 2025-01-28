import 'package:flutter/material.dart';
import 'package:chat/pages/userprofile_page.dart';

class RecordBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _profilePic(context),
                  const SizedBox(height: 20),
                  _emailField(context),
                  const SizedBox(height: 20),
                  _nameField(context),
                  const SizedBox(height: 20),
                  _ageField(context),
                  const SizedBox(height: 20),
                  _phoneField(context),
                  const SizedBox(height: 20),
                  _addressField(context),
                  const SizedBox(height: 20),
                  _createProfileButton(context),
                ],
              ),
            ),
            // You can add another widget in the Stack if needed
          ],
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle image upload
      },
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add_a_photo, size: 50),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _ageField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _phoneField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Phone No',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _addressField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _createProfileButton(BuildContext context) {
    return SizedBox(
      width: 220.0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const userProfile(),
            ),
          );
        },
        child: ElevatedButton(
          onPressed: () {
            // Handle create profile action
          },
          child: const Text('Create Profile'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
