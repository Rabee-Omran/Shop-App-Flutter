import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ro/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static final routeName = '/detail-page';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final productData =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
    );
  }
}
