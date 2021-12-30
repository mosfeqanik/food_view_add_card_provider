import 'package:flutter/material.dart';
import 'package:food_add_cart/providers/cart.dart';
import 'package:food_add_cart/widgets/badge.dart';
import 'package:food_add_cart/widgets/food_grid.dart';
import 'package:provider/provider.dart';

class FoodsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Order'),
        actions: [
          Consumer<Cart>(
            builder: (context, CartProvider, child) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {},
              ),
              value: CartProvider.itemCount.toString(),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FoodsGrid(),
    );
  }
}