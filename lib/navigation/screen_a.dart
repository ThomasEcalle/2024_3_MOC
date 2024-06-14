import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Coucou screen A'),
            ElevatedButton(
              onPressed: () => _onBack(context),
              child: const Text('Go back'),
            )
          ],
        ),
      ),
    );
  }

  void _onBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
