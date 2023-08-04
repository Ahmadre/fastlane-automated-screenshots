import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screenshots/screens/product_detail_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Products Overview'),
      ),
      body: FutureBuilder(
        future: http.get(
          Uri.parse('https://dummyjson.com/products?limit=20'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: Text(
                '--- No data ---',
                style: TextStyle(fontSize: 24),
              ),
            );
          }

          final List products = (json.decode(snapshot.data!.body)
              as Map<String, dynamic>)['products'] as List;

          debugPrint('products: ${products[0]}');

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
            ),
            itemCount: 20,
            itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ProductDetailScreen(
                      product: products[index],
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,                    
                    children: <Widget>[
                      Image.network(
                        products[index]['thumbnail'],
                        height: 100,
                        width: 100,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              products[index]['title'],
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
