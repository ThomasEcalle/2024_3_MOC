import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/product.dart';
import 'package:moc_2024_3/api_calls/product_list_item.dart';

class ApiCallsScreen extends StatefulWidget {
  const ApiCallsScreen({super.key});

  @override
  State<ApiCallsScreen> createState() => _ApiCallsScreenState();
}

class _ApiCallsScreenState extends State<ApiCallsScreen> {
  bool _loading = true;
  List<Product> _products = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    try {
      final products = await _getAllProducts();
      setState(() {
        _loading = false;
        _products = products;
      });
    } catch (error) {
      setState(() {
        _loading = false;
        _error = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Text('Oups, une erreur est survenue: $_error'),
      );
    }

    if (_products.isEmpty) {
      return const Center(
        child: Text('Oups, aucun produit'),
      );
    }

    return ListView.separated(
      itemCount: _products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return ProductListItem(product: _products[index]);
      },
    );
  }

  Future<List<Product>> _getAllProducts() async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
    final response = await dio.get('/products');
    final data = response.data;
    final products = (data['products'] as List).map((productJson) => Product.fromJson(productJson)).toList();
    return products;
  }
}
