import 'package:flutter/material.dart';
import 'package:food_add_cart/providers/cart.dart';
import 'package:food_add_cart/providers/food.dart';
import 'package:food_add_cart/screens/food_detail_page.dart';

import 'package:provider/provider.dart';

class FoodItem extends StatelessWidget {
  FoodItem();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context,listen: false);
    return Consumer<Food>(
      builder: (context, FoodProvider, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(FoodDetailScreen.routeName, arguments: FoodProvider.id);
              },
              child: Image.asset(
                FoodProvider.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              leading: IconButton(
                icon: Icon(
                    FoodProvider.isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  FoodProvider.toggleFavouriteData();
                },
              ),
              title: Text(
                FoodProvider.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  cart.addItem(FoodProvider.id, FoodProvider.price, FoodProvider.title);
                },
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        );
      },
    );
  }
}
