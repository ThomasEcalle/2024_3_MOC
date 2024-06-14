import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/product.dart';

class ScreenC extends StatelessWidget {
  static void navigateTo(BuildContext context, Product product) {
    Navigator.of(context).pushNamed('/screenC', arguments: product);
  }

  const ScreenC({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Coucou voici le produit: ${product.title}'),
            ElevatedButton(
              onPressed: () => _onTap(context),
              child: const Text('Replace with screen B'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    //Navigator.of(context).pushNamed('/screenB');
    Navigator.of(context).pushReplacementNamed('/screenB');
  }
}
