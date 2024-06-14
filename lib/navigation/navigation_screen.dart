import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to screen A'),
              onPressed: () => _goToScreenA(context),
            ),
            ElevatedButton(
              child: const Text('Go to screen B'),
              onPressed: () => _goToScreenB(context),
            ),
            ElevatedButton(
              child: const Text('Go to screen C'),
              onPressed: () => _goToScreenC(context),
            ),
          ],
        ),
      ),
    );
  }

  void _goToScreenA(BuildContext context) {}

  void _goToScreenB(BuildContext context) {}

  void _goToScreenC(BuildContext context) {}
}
