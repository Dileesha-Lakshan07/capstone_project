import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final String image;
  final String description;

  const ContainerBox({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 371,
      height: 377,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        border: const Border.symmetric(
            vertical: BorderSide(color: Colors.grey, width: 2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  size: 45,
                  color: Colors.black87,
                ),
              ),
              const Text(
                style: TextStyle(fontSize: 18),
                "Profile holder name",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image radius
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                width: 335,
                height: 177,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up_alt_rounded,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.messenger_rounded,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              description,
            ),
          ),
        ],
      ),
    );
  }
}
