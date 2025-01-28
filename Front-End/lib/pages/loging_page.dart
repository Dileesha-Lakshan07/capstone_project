import 'package:chat/pages/signup_page.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // text editing controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  // sign user in method
  void signInUser() async {
    setState(() {
      isLoading = true;
    });

    var email = userNameController.text;
    var password = passwordController.text;

    // Ensure both fields are filled
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog('Please enter both email and password.');
      return;
    }

    try {
      User? user = await AuthService.instance.signInWithEmail(email, password);

      setState(() {
        isLoading = false;
      });

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog('Login failed. Please check your email and password.');
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 246, 244),
        body: Stack(
          children: [
            // Your existing UI elements (background, buttons, etc.)
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  _signInPic(context),
                  _header(context),
                  _inputFeild(context),
                  _forgotPassword(context),
                  _elevateButton(context),
                  _signUp(context),
                  _otherConnect(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signInPic(context) {
    return Container(
      child: const Image(
        image: AssetImage("assets/signupimage.png"),
        width: 250,
        height: 250,
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
          Text("Login",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              textAlign: TextAlign.left),
          Text("Please Sign Into Continue",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            fillColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
            filled: true,
            prefixIcon: const Icon(Icons.lock_rounded),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          ),
          obscureText: true,
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text("Forgot Password ?"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
      ],
    );
  }

  _elevateButton(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(
          onPressed: signInUser,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all(const StadiumBorder()),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10)),
          ),
          child: const Text(
            "Sign In",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  _signUp(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 18),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const signUp();
              }));
            },
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => signUp(),
                      ));
                },
                child: const Text("Sign Up"))),
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
                child: Image(
                  image: AssetImage("assets/googlelogo.png"),
                ),
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
