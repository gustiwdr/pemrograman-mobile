import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Jungle'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.onGoToProfilePagePressed();
              },
              child: const Text('Profile Page With URL'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.onGoToProfilePageWithAssets();
              },
              child: const Text('Profile Page With Assets'),
            ),
          ],
        ),
      ),
    );
  }
}
