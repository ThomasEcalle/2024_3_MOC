import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? ''),
      subtitle: Text(product.price?.toString() ?? ''),
    );
  }
}
