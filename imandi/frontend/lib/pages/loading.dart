import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 246, 244),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
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
                      height: 700,
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
            ],
          ),
        ),
      ),
    );
  }
}
