import 'package:flutter/material.dart';
import 'package:foodapp/Models/cart.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/Screens/CartScreen.dart';
import 'package:foodapp/Widgets/CardItem.dart' as ci;
import 'package:foodapp/Models/orders.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfcfcfc),
        title: Text(
          "Cart",
          style: TextStyle(
            color: Color(0xFFfc6a26),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: text,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$ ${cart.totalprice}',
                      style: textstyle,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalprice);
                      cart.clearItems();
                      Navigator.pushNamed(context, '/orders');
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'RobotoCondensed',
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => ci.CartItem(
                id: cart.items.values.toList()[index].id,
                title: cart.items.values.toList()[index].title,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
