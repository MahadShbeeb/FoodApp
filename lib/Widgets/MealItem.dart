import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/Models/MealsProvider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return Consumer<Product>(
      builder: (context, product, child) => GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/productdetails',
                arguments: product.id);
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  product.imageURL,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    product.title,
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Details',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                      onPressed: null,
                      // Navigator.pushNamed<bool>(context, '/product/' + index.toString()),
                    ),
                    IconButton(
                      icon: Icon(
                        product.isFavourite == false
                            ? Icons.favorite_border
                            : Icons.favorite,
                        size: 25,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        product.toggleFavourite();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
