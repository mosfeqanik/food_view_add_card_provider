import 'package:flutter/material.dart';
import 'package:food_add_cart/providers/cart.dart';
import 'package:food_add_cart/providers/foods_provider.dart';
import 'package:food_add_cart/screens/food_detail_page.dart';
import 'package:food_add_cart/screens/food_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Foods>(create: (context) => Foods()),
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Order',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
                .copyWith(secondary: Colors.orange),
          ),
          home: FoodsOverviewScreen(),
          routes: {
            FoodDetailScreen.routeName: (ctx) => FoodDetailScreen(),
          }),
    );
  }
}
