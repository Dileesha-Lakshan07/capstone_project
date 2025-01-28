import 'package:chat/pages/comment_page.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/pages/userprofile_page.dart';
import 'package:chat/widgets/first_container.dart';
import 'package:chat/widgets/custom_bottom_nav.dart'; // Import the CustomBottomNavBar
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar

      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Community",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xffFFB03E),
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor:
            const Color(0xffFFB03E).withOpacity(0.1), // Set to transparent
        elevation: 2,
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle,
                          size: 45,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            border: const Border.symmetric(
                                horizontal: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: "What's on Your Mind?",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Comment(),
                              ));
                        },
                        icon: const Icon(
                          Icons.photo_library,
                          size: 35,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8, // Reduced the gap
                ),
                const ContainerBox(
                  image: "assets/dog.jpg",
                  description:
                      "Just wanted to share a picture of Bella enjoying her favorite spot in the park. She's such a bundle of joy and always makes every moment special!",
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 8, // Reduced the gap
                ),
                const ContainerBox(
                  image: "assets/cute-cat.jpg",
                  description:
                      "My cat has discovered a new game with her favorite feather toy, and it's been a joy watching her leap and pounce with such excitement! ",
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),

      extendBody: false,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2, // Set the current index to 2 for the Community page
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StorePage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => userProfile()),
            );
          }
        },
      ),
    );
  }
}
