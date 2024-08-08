import 'package:flutter/material.dart';

class RecordBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _profilePic(context),
              SizedBox(height: 20),
              _emailField(context),
              SizedBox(height: 20),
              _nameField(context),
              SizedBox(height: 20),
              _ageField(context),
              SizedBox(height: 20),
              _phoneField(context),
              SizedBox(height: 20),
              _addressField(context),
              SizedBox(height: 20),
              _createProfileButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle image upload
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add_a_photo, size: 50),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _ageField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _phoneField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Phone no',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _createProfileButton(BuildContext context) {
    return SizedBox(
      width: 220.0,
      child: ElevatedButton(
        onPressed: () {
          // Handle create profile action
        },
        child: Text('Create Profile'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
