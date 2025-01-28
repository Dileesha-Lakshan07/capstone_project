import 'package:chat/pages/loging_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isLoading = false;

  // sign user in method
  void signUPUser() async {
    setState(() {
      isLoading = true;
    });

    var email = emailController.text;
    var user_name = userNameController.text;
    var password = passwordController.text;
    var phone_number = phoneNumberController.text;

    if (email.isEmpty ||
        user_name.isEmpty ||
        password.isEmpty ||
        phone_number.isEmpty) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog(
          'Please enter email, username, password, and phone number.');
      return;
    }

    try {
      // Register user using Firebase Auth
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save additional user details (like phone number) in Firestore
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': email,
          'username': user_name,
          'phone_number': phone_number,
          'created_at': Timestamp.now(),
        });

        // Navigate to Home Page on successful registration
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const login()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'weak-password') {
        showErrorDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showErrorDialog('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showErrorDialog('The email address is badly formatted.');
      } else {
        showErrorDialog('An error occurred. Please try again.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog('An error occurred. Please try again.');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Error showing method
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 246, 244),
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
            ), // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/background_image.jpg"), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Foreground Content
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(children: [
                _signupImage(context),
                _header(context),
                _inputFeild(context),
                _elevateButton(context),
                _signIn(context),
                _otherConnect(context),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  _signupImage(context) {
    return Center(
      child: Container(
        child: const Image(
          image: AssetImage("assets/signupimage.png"),
          width: 250,
          height: 250,
        ),
      ),
    );
  }

  _header(context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Register",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              textAlign: TextAlign.left),
          Text(
            "Please Register Into Continue",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _inputFeild(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          controller: userNameController,
          decoration: InputDecoration(
              hintText: "User Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
         TextField(
          controller: emailController,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
              filled: true,
              prefixIcon: const Icon(Icons.email)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: phoneNumberController,
          decoration: InputDecoration(
              hintText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
              filled: true,
              prefixIcon: const Icon(Icons.phone)),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            fillColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
            filled: true,
            prefixIcon: const Icon(Icons.lock_rounded),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  _elevateButton(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(
          onPressed: signUPUser,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all(const StadiumBorder()),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10)),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  _signIn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Allready have an account?",
          style: TextStyle(fontSize: 18),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const login();
              }));
            },
            child: const Text("Sign In")),
      ],
    );
  }

  _otherConnect(context) {
    return Column(
      children: <Widget>[
        const Text("Or Connect With", style: TextStyle(fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const SizedBox(
                height: 50,
                width: 50,
                child: Image(image: AssetImage("assets/googlelogo.png")),
              ),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              onPressed: () {},
              icon: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(image: AssetImage("assets/Facebook_Logo.png"))),
            ),
          ],
        ),
      ],
    );
  }
}
