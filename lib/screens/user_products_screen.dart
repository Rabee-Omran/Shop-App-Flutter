import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ro/providers/products.dart';
import 'package:shop_ro/screens/edit_product_screen.dart';
import 'package:shop_ro/widgets/app_drawer.dart';
import 'package:shop_ro/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refrechProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, EditProductScreen.routeName);
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refrechProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: productsData.items.length,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    UserProductItem(
                        productsData.items[i].id,
                        productsData.items[i].title,
                        productsData.items[i].imageUrl),
                    Divider()
                  ],
                );
              }),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
