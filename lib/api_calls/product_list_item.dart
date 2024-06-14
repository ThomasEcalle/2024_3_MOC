import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
    this.onTap,
  });

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? ''),
      subtitle: Text(product.price?.toString() ?? ''),
      onTap: onTap,
    );
  }
}
