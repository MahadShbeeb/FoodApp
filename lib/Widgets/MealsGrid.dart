import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/Models/MealsProvider.dart';
import 'package:foodapp/Widgets/MealItem.dart';

class MealsGrid extends StatelessWidget {
  final bool showFav;
  final bool showDrink;
  final bool showMeat;
  final bool showSweet;
  final bool showSandwish;

  MealsGrid({
    this.showFav,
    this.showDrink,
    this.showMeat,
    this.showSandwish,
    this.showSweet,
  });

  @override
  Widget build(BuildContext context) {
    final products = showFav
        ? Provider.of<Products>(context).favouriteproducts
        : showSandwish
            ? Provider.of<Products>(context).sandwishproducts
            : showSweet
                ? Provider.of<Products>(context).sweetproducts
                : showMeat
                    ? Provider.of<Products>(context).meatproducts
                    : showDrink
                        ? Provider.of<Products>(context).drinkproducts
                        : Provider.of<Products>(context).products;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.all(5),
            child: ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(),
            ));
      },
    );
  }
}
