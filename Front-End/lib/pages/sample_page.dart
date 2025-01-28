import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar

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
              padding: const EdgeInsets.all(70.0), // Add some padding if needed
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
              padding: const EdgeInsets.all(60.0), // Add some padding if needed
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
              padding: const EdgeInsets.all(55.0), // Add some padding if needed
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
              padding: const EdgeInsets.all(10.0), // Add some padding if needed
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
          const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 800,
                  // Adjust the height as needed
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Login",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
