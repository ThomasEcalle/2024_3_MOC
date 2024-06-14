import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/product.dart';
import 'package:moc_2024_3/api_calls/product_list_item.dart';
import 'package:moc_2024_3/navigation/screen_c.dart';

class ApiCallsScreen extends StatefulWidget {
  const ApiCallsScreen({super.key});

  @override
  State<ApiCallsScreen> createState() => _ApiCallsScreenState();
}

class _ApiCallsScreenState extends State<ApiCallsScreen> {
  bool _loading = true;
  List<Product> _products = [];
  String? _error;
  Future<List<Product>>? productsFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    productsFuture = _getAllProducts();
    //_init();
    _scrollController.addListener(() {});
  }

  // void _init() async {
  //   try {
  //     final products = await _getAllProducts();
  //     setState(() {
  //       _loading = false;
  //       _products = products;
  //     });
  //   } catch (error) {
  //     setState(() {
  //       _loading = false;
  //       _error = error.toString();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              final hasError = snapshot.hasError;
              if (hasError) {
                return Center(
                  child: Text('Oups, une erreur est survenue: ${snapshot.error}'),
                );
              }

              final products = snapshot.data;
              if (products == null) {
                return const Center(
                  child: Text('Oups, la liste est nulle'),
                );
              }

              if (products.isEmpty) {
                return const Center(
                  child: Text('Oups, aucun produit'),
                );
              }

              return ListView.separated(
                controller: _scrollController,
                itemCount: products.length + 1,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  // if (index == products.length) {
                  //   return MonLoadMore();
                  // }

                  return ProductListItem(
                    product: products[index],
                    onTap: () => _onProductTap(products[index]),
                  );
                },
              );
          }
        },
      ),
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
      controller: _scrollController,
      itemCount: _products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return ProductListItem(
          product: _products[index],
          onTap: () => _onProductTap(_products[index]),
        );
      },
    );
  }

  void _onProductTap(Product product) {
    //Navigator.of(context).pushNamed('/screenC', arguments: product);
    ScreenC.navigateTo(context, product);
  }

  Future<List<Product>> _getAllProducts() async {
    final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));
    final response = await dio.get('/products');
    final data = response.data;
    final products = (data['products'] as List).map((productJson) => Product.fromJson(productJson)).toList();
    return products;
  }
}
