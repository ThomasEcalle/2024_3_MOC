import 'package:flutter/material.dart';
import 'package:moc_2024_3/navigation/screen_a.dart';

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

  void _goToScreenA(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ScreenA()),
    );
  }

  void _goToScreenB(BuildContext context) {
    Navigator.of(context).pushNamed('/screenB');
  }

  void _goToScreenC(BuildContext context) {
    Navigator.of(context).pushNamed('/screenC', arguments: 42);
  }
}
