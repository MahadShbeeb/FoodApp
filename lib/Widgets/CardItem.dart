import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/Models/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({this.id, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(this.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        padding: EdgeInsets.all(10),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(this.id);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Deletion'),
                  content: Text('Do you want to remove this item ?'),
                  actions: [
                    Divider(),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Yes')),
                    FlatButton(
                        textColor: Theme.of(context).errorColor,
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('No')),
                  ],
                ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '\$${this.price}',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'RobotoCondensed',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Text(
              this.title,
              style: text,
            ),
            subtitle: Text(
              'Total : ${this.price * this.quantity}',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                  fontFamily: 'RobotoCondensed'),
            ),
            trailing: Text(
              'x${this.quantity}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'RobotoCondensed',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
