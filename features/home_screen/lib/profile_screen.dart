import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(
          16.0,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              "assets/Bijan.jpg",
              height: 170,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "Hi, I'm Bijantyum",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "I am a Mobile developer with two years of experience, now I also contribute as an External Code Review at Dicoding Indonesia. If you are interested in my results, you can contact by Email bijantium.sinatria@gmail.com or what's App 0899 999 6043",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
