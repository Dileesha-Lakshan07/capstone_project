import 'package:flutter/material.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage(
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
      backgroundColor: Color.fromARGB(255, 249, 246, 244),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Checkbox.width,
                  ),
                  child: SizedBox(
                    height: 630,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/foot.png',
                    ),
                  ),
                ),
                Opacity(
                  opacity: 1.0,
                  child: SizedBox(
                      height: 360,
                      width: 360,
                      child: Image.asset('assets/wave-cute.png')),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 20,
              child: Stack(
                children: [
                  Container(
                    width: width * progress,
                    height: height,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 216, 161),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${(progress * Checkbox.width).toInt()}%',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 70, 26, 16),
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
