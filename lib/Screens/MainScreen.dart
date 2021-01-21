import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Models/Badge.dart';
import 'package:foodapp/Widgets/MealsGrid.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/Models/cart.dart';
import 'package:foodapp/main.dart';

var fav = false;
var drink = false;
var meat = false;
var sweet = false;
var sandwish = false;
var all = false;

enum FilterOptions { Fav, Drink, Meat, Sweet, Sandwish, All }

class MainScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfcfcfc),
        title: Text(
          "Resturant Menu",
          style:
              TextStyle(color: Color(0xFFfc6a26), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                selectedValue == FilterOptions.Fav ? fav = true : fav = false;
                selectedValue == FilterOptions.Sweet
                    ? sweet = true
                    : sweet = false;
                selectedValue == FilterOptions.Sandwish
                    ? sandwish = true
                    : sandwish = false;
                selectedValue == FilterOptions.Drink
                    ? drink = true
                    : drink = false;
                selectedValue == FilterOptions.Meat
                    ? meat = true
                    : meat = false;
                selectedValue == FilterOptions.All ? all = true : all = false;
              });
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.deepOrange,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favourite'),
                value: FilterOptions.Fav,
              ),
              PopupMenuItem(
                child: Text('Sweet'),
                value: FilterOptions.Sweet,
              ),
              PopupMenuItem(
                child: Text('Sandwish'),
                value: FilterOptions.Sandwish,
              ),
              PopupMenuItem(
                child: Text('Drink'),
                value: FilterOptions.Drink,
              ),
              PopupMenuItem(
                child: Text('Meat'),
                value: FilterOptions.Meat,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: MealsGrid(
        showFav: fav,
        showDrink: drink,
        showMeat: meat,
        showSweet: sweet,
        showSandwish: sandwish,
      ),
    );
  }
}
