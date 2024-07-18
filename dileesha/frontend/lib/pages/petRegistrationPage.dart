import 'package:flutter/material.dart';

class PetRegistrationPage extends StatefulWidget {
  @override
  _PetRegistrationPageState createState() => _PetRegistrationPageState();
}

class _PetRegistrationPageState extends State<PetRegistrationPage> {
  final TextEditingController _birthdayController = TextEditingController();
  List<bool> isSelected = [true, false];
  List<bool> isSelected2 = [true, false];

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
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
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

  Widget _nameField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _birthdayField(BuildContext context) {
    return TextField(
      controller: _birthdayController,
      decoration: InputDecoration(
        labelText: 'Birthday',
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }

  Widget _genderToggle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
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
          borderWidth: 2,
          selectedBorderColor: Colors.orange,
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          constraints: BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          children: <Widget>[
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
        Text(
          'Status',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ToggleButtons(
          borderColor: Colors.orange,
          fillColor: Colors.orange,
          borderWidth: 2,
          selectedBorderColor: Colors.orange,
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          constraints: BoxConstraints(
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
          children: <Widget>[
            Text("Yes"),
            Text("No"),
          ],
        ),
      ],
    );
  }

  Widget _weightField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Weight (Kg)',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _breedField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Breed',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 120.0, // Set the width here
          child: ElevatedButton(
            onPressed: () {
              // Handle back action
            },
            child: Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Set the border radius here
              ),
            ),
          ),
        ),
        SizedBox(
          width: 120.0, // Set the width here
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //    context,
              //    MaterialPageRoute(
              //      builder: (context) => Navbar(),
              //    ),
              //  );
            },
            child: Text('Add'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Set the border radius here
              ),
            ),
          ),
        )
      ],
    );
  }
}
