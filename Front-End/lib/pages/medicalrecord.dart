import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/pages/userprofile_page.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart'; // Add this package for date formatting

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  _MedicalRecordState createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String? _pickedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _pickedFile = result.files.single.name;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    setState(() {
      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // App Bar
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Medical Record",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFB03E),
              fontSize: 28,
              fontFamily: 'CustomFont',
            ),
          ),
        ),
        backgroundColor: Colors.transparent, // Set to transparent
        elevation: 1.0, // Remove the shadow
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
          Positioned(
            top: 55.0,
            left: 55.0,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset('assets/paw.png', height: 60, width: 60),
            ),
          ),
          Positioned(
            bottom: 70.0,
            left: 70.0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/paw.png', height: 90, width: 90),
            ),
          ),
          Positioned(
            bottom: 60.0,
            right: 60.0,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset('assets/paw.png', height: 60, width: 70),
            ),
          ),
          Positioned(
            bottom: 190.0,
            right: 190.0,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset('assets/paw.png', height: 60, width: 60),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  const Center(
                    child: Text(
                      "Your Pet Name",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xffF9E8BD).withOpacity(0.4),
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
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: TextField(
                              controller: _dateController,
                              decoration: const InputDecoration(
                                labelText: 'Date',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(27))),
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _medicineController,
                          decoration: const InputDecoration(
                            labelText: 'Medicine',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(27))),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _noteController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Note',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(27))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _pickFile,
                    child: Container(
                      height: 190,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 249, 230, 160),
                        image: const DecorationImage(
                          image: AssetImage("assets/medical-records.jpg"),
                          fit: BoxFit.cover,
                          opacity: 0.5,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline,
                              size: 40, color: Colors.black), // Add your icon
                          SizedBox(height: 10), // Spacing between icon and text
                          Text(
                            "Add Your Record",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black, // Text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Icon(Icons.home)),
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
                child: Icon(Icons.shopping_cart)),
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
                child: Icon(Icons.people)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => userProfile(),
                      ));
                },
                child: Icon(Icons.account_circle)),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
