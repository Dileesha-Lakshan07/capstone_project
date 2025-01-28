import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Comment extends StatelessWidget {
  Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        // App Bar
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Community",
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
                    0.5, // Adjust the opacity as needed for watermark effect
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
                    0.2, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 60,
                  width: 70,
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
                    0.5, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Create a Post",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 73,
                        ),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: const Color.fromARGB(255, 249, 246, 244),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 0,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Post",
                                  style: TextStyle(
                                    color: Color.fromARGB(184, 51, 17, 4),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          border: const Border.symmetric(
                              vertical: BorderSide(
                            color: Colors.grey,
                            width: 3.5,
                          ))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "What's on your mind?",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: const Color.fromARGB(255, 249, 246, 244),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 0,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo),
                            Text(
                              "Image/Video",
                              style: TextStyle(
                                  color: Color.fromARGB(184, 51, 17, 4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ) // Add more widgets here if needed
                ],
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: 2,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  GestureDetector(onTap: () {}, child: const Icon(Icons.home)),
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
                  onTap: () {}, child: const Icon(Icons.people)),
              label: 'People',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
