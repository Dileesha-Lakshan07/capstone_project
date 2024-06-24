import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/homepage.dart';
import 'package:frontend/widgets/container.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2CC92),
      appBar: AppBar(
        title: const Text(
          "Community",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 36,
            ),
          ),
        ],
        backgroundColor: const Color(0xffFFB03E),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle,
                          size: 45,
                        ),
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF9E8BD)),
                      child: const Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "What's on your mind?",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_camera_rounded,
                        size: 38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ContainerBox(
              description:
                  "Just wanted to share a picture of Bella enjoying her favorite spot in the park. She's such a bundle of joy and always makes every moment special!",
              image: "assets/puppyatpark.jpg",
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            const ContainerBox(
              description:
                  "My cat has discovered a new game with her favorite feather toy, and it's been a joy watching her leap and pounce with such excitement! ",
              image: "assets/cat.jpg",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(
              0xffFFB03E), // Background color for the navigation bar
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: const Icon(Icons.home)),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined),
              label: 'Plus',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.people),
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
