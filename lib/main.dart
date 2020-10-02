import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ro/providers/cart.dart';
import 'package:shop_ro/providers/products.dart';
import 'package:shop_ro/screens/product_detail_screen.dart';
import 'package:shop_ro/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
         ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child:MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'),
      home: ProductOverviewScreen(),
      routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()},
    ) ,
    );
    
    
  }
}
