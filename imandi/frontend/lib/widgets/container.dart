import 'dart:ffi';

import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final String description;
  final String image;
  const ContainerBox(
      {super.key, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 371,
      height: 377,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF9E8BD).withOpacity(.5),
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
                ),
              ),
              const Text(
                "Profile holder name",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
            ),
          ),
          Image.asset(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image,
            width: 335,
            height: 177,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.thumb_up,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
