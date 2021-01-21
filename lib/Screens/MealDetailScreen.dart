import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/Models/MealsProvider.dart';
import 'package:foodapp/Models/cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    print(productId);
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    final cart = Provider.of<Cart>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfcfcfc),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '${product.title}',
          style: TextStyle(
            color: Color(0xFFfc6a26),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.imageURL,
              width: double.infinity,
              height: 300,
            ),
            Center(
              child: Text(
                '${product.title}',
                style: text,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                '\$${product.price}',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${product.description}',
              style: TextStyle(
                  fontSize: 17, fontFamily: 'Montserrat', color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: FlatButton(
                // color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.deepOrange)),
                onPressed: () {
                  cart.addItem(product.id, product.title, product.price);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Added item to cart',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(
                        seconds: 2,
                      ),
                      action: SnackBarAction(
                          label: 'UNDO',
                          textColor: Theme.of(context).errorColor,
                          onPressed: () {
                            cart.removeUndoItem(product.id);
                          }),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                          color: Colors.deepOrange),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                      focusColor: Colors.black12,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
