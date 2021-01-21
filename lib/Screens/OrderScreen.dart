import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/Models/orders.dart' show Orders;
import 'package:foodapp/Widgets/OrderItem.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfcfcfc),
        title: Text(
          "Orders",
          style: TextStyle(
            color: Color(0xFFfc6a26),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
