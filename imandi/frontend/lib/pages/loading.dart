import 'package:flutter/material.dart';

class load extends StatelessWidget {
  const load(
      {super.key,
      required this.width,
      required this.height,
      required this.progress});
  final double width;
  final double height;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2CC92),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/wave-cute.png'),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 20,
              child: Stack(
                children: [
                  Container(
                    width: width * progress,
                    height: height,
                    decoration: BoxDecoration(
                      color: Color(0xffAC502F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Color(0xffD7B064),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
