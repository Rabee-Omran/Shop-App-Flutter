import 'package:flutter/material.dart';
import 'package:shop_ro/widgets/product_grid.dart';


class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductGrid(),
    );
  }
}
